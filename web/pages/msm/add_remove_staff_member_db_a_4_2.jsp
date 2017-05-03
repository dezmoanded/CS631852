<%-- 
    Document   : add_remove_staff_member_db_a_4
    Created on : Apr 27, 2017, 7:32:24 PM
    Author     : bakfark
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Newark Medical Associates(NMA)</title>
    </head>
    <body>
        <h1>Add Surgeon</h1>

<%--<c:if test="${ empty param.name or empty param.SSN or empty param.gender or empty param.address or empty param.phoneNumber or empty specialty or empty contractType or empty contractLengthInYears}">
            <c:redirect url="add_remove_staff_member_db_a_1_1" >
                <c:param name="errMsg" value="Please Enter Surgeon Data" />
            </c:redirect>
 
        </c:if>--%>

        <jsp:include page="/includes/db.jsp" />
    <sql:update var="physician" dataSource="${snapshot}">
        INSERT INTO Persons (name,SSN,gender,address,phoneNumber)
        VALUES (?,?,?,?,?);
        <sql:param value="${param.name}" />
        <sql:param value="${param.SSN}" />
        <sql:param value="${param.gender}" />
        <sql:param value="${param.address}" />
        <sql:param value="${param.phoneNumber}" />
    </sql:update>
    <sql:update var="physician" dataSource="${snapshot}">
        INSERT INTO Employees (ID, Salary, employeeNumber)
        Select ID, ?, ? from Persons order by ID desc limit 1;
        <sql:param value="${param.salary}" />
        <sql:param value="${param.employeeNumber}" />
    </sql:update>
     <sql:update var="physician" dataSource="${snapshot}">
        INSERT INTO Physicians (ID, speciality)
        Select ID, ? from Persons order by ID desc limit 1;
        <sql:param value="${param.specialty}" />
     </sql:update>

<sql:update var="physician" dataSource="${snapshot}">
    INSERT INTO Surgeons (ID, contractType, contractLengthInYears)
    Select ID, ?, ? from Persons order by ID desc limit 1;
    <sql:param value="${param.contractType}" />
    <sql:param value="${param.contractLengthInYears}" />
</sql:update>

        
        <a href="#" onClick="history.go(-1);return true;">Send Me Back A Page!</a>
<c:if test="${physician>=1}">
            <font size="5" color='green'> Congratulations ! Data added
            successfully.</font>
 
            <c:redirect url="add_remove_staff_member_db_a_4_1.jsp" >
                <c:param name="susMsg" value="Congratulations ! Data added
            successfully." />
            </c:redirect>
        </c:if> 
    </body>
</html>

    