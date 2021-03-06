<%-- 
    Document   : add_remove_staff_member_db_a_3
    Created on : Apr 27, 2017, 7:31:40 PM
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
        <h1>Add Support Staff</h1>

<c:if test="${ empty param.name or empty param.SSN or empty param.gender or empty param.address or empty param.phoneNumber}">
            <c:redirect url="add_remove_staff_member_db_a_3_1" >
                <c:param name="errMsg" value="Please Enter Support Staff Data" />
            </c:redirect>
 
        </c:if>

<jsp:include page="/includes/db.jsp" />
    <sql:update var="staff" dataSource="${snapshot}">
        INSERT INTO Persons (name,SSN,gender,address,phoneNumber)
        VALUES (?,?,?,?,?);
        <sql:param value="${param.name}" />
        <sql:param value="${param.SSN}" />
        <sql:param value="${param.gender}" />
        <sql:param value="${param.address}" />
        <sql:param value="${param.phoneNumber}" />
    </sql:update>
    <sql:update var="staff" dataSource="${snapshot}">
        INSERT INTO Employees (ID, Salary, employeeNumber)
        Select ID, ?, ? from Persons order by ID desc limit 1;
        <sql:param value="${param.salary}" />
        <sql:param value="${param.grade}" />
    </sql:update>
     <sql:update var="staff" dataSource="${snapshot}">
        INSERT INTO SupportStaff (ID)
        Select ID from Persons order by ID desc limit 1;
     </sql:update>
        
        <a href="#" onClick="history.go(-1);return true;">Send Me Back A Page!</a>
<c:if test="${staff>=1}">
            <font size="5" color='green'> Congratulations ! Data added
            successfully.</font>
 
            <c:redirect url="add_remove_staff_member_db_a_3_1.jsp" >
                <c:param name="susMsg" value="Congratulations ! Data added
            successfully." />
            </c:redirect>
        </c:if> 
    </body>
</html>

    

