<%-- 
    Document   : add_remove_staff_member_db_2
    Created on : Apr 27, 2017, 7:27:16 PM
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
        <h1>Add Nurse</h1>

<c:if test="${ empty param.name or empty param.SSN or empty param.gender or empty param.address or empty param.phoneNumber or empty param.sugeryType or empty grade or empty yearsOfExperience or empty salary or empty employeeNumber }">
            <c:redirect url="add_remove_staff_member_db_a_2_1" >
                <c:param name="errMsg" value="Please Enter Nurse Data" />
            </c:redirect>
 
        </c:if>

<sql:update var="nurse" dataSource="jdbc/HospitalDatabase">
    INSERT INTO Persons (name,SSN,gender,address,phoneNumber)
    VALUES (?,?,?,?,?)
    <sql:param value="${param.name}" />
    <sql:param value="${param.SSN}" />
    <sql:param value="${param.gender}" />
    <sql:param value="${param.address}" />
    <sql:param value="${param.phoneNumber}" />
    INSERT INTO Nurses (surgeryType, grade, yearsOfExperience)
    VALUES (?,?,?)
    <sql:param value="${param.surgeryType}" />
    <sql:param value="${param.grade}" />
    <sql:param value="${param.yearsOfExperience}" />
    INSERT INTO Employee (Salary, employeeNumber)
    VALUES (?,?)
    <sql:param value="${param.salary}" />
    <sql:param value="${param.employeeNumber}" />
</sql:update>

        
        <a href="#" onClick="history.go(-1);return true;">Send Me Back A Page!</a>
<c:if test="${result>=1}">
            <font size="5" color='green'> Congratulations ! Data added
            successfully.</font>
 
            <c:redirect url="add_remove_staff_member_db_a_2_1" >
                <c:param name="susMsg" value="Congratulations ! Data added
            successfully." />
            </c:redirect>
        </c:if> 
    </body>
</html>

    

