<%-- 
    Document   : newjsp
    Created on : Apr 26, 2017, 11:08:25 PM
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
        <jsp:include page="/includes/head.jsp" />
    </head>
    <body>
        <h1>Physicians</h1>
    </body>
<jsp:include page="/includes/db.jsp" />
<sql:query var="physicians1" dataSource="${snapshot}">
    SELECT SSN, name, gender, address, phoneNumber, employeeNumber, speciality, salary
    FROM Physicians, Persons, Employees
    WHERE Persons.ID = Employees.ID
    AND Physicians.ID = Employees.ID
</sql:query>
    
<table  align="left" border="1">
    <!-- column headers -->
    <tr>
    <c:forEach var="columnName" items="${physicians1.columnNames}">
        <th><c:out value="${columnName}"/></th>
    </c:forEach>
    
    </tr>
<!-- column data -->
<c:forEach var="row" items="${physicians1.rowsByIndex}">
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
