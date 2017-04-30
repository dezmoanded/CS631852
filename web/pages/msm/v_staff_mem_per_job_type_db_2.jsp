<%-- 
    Document   : v_staff_mem_per_job_type_db_2
    Created on : Apr 27, 2017, 12:11:58 AM
    Author     : bakfark
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Newark Medical Associates(NMA)</title>
    </head>
    <body>
        <h1>Nurse</h1>
    </body>
 
<sql:query var="nurses1" dataSource="jdbc/HospitalDatabase">
    SELECT *
    FROM Nurses, Persons, Employees
    WHERE Persons.ID = Employees.ID
    AND Nurses.ID = Employees.ID
</sql:query>
    
<table  align="left" border="1">
    <!-- column headers -->
    <tr>
    <c:forEach var="columnName" items="${nurses1.columnNames}">
        <th><c:out value="${columnName}"/></th>
    </c:forEach>
    
    </tr>
<!-- column data -->
<c:forEach var="row" items="${nurses1.rowsByIndex}">
    <tr>
    <c:forEach var="column" items="${row}">
        <td><c:out value="${column}"/></td>
    </c:forEach>    
    </tr>
</c:forEach>
</table>
    <br><br>
    <body>
       <a href="#" onClick="history.go(-1);return true;">Send Me Back A Page!</a>
    </body>
</html>
