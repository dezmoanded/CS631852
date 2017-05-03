<%-- 
    Document   : asnrm_nurse_pat
    Created on : Apr 19, 2017, 12:47:05 PM
    Author     : bakfark
--%>

<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Newark Medical Associates(NMA)</title>
    </head>
    <body>
        <h1>Assign/Remove a Nurse</h1>
        
        <jsp:include page="/includes/db.jsp" />
        
        <c:if test="${!empty param.remove}">
            <sql:update dataSource="${snapshot}">
                UPDATE Patients set nurseID = NULL where ID = ${param.patientID}
            </sql:update>
        </c:if>
                
        <c:if test="${!empty param.doctorID}">
            <sql:update dataSource="${snapshot}">
                UPDATE Patients set nurseID = ${param.nurseID} where ID = ${param.patientID}
            </sql:update>
        </c:if>
        
        <sql:query var="table" dataSource="${snapshot}">
            SELECT Persons.ID, Persons.name 
            from Persons, Patients
            where Persons.ID = Patients.nurseID
                and Patients.ID = ${param.patientID}
        </sql:query>
                <h2>Nurse currently assigned to Patient</h2>
                <c:forEach var="row" items="${table.rows}">
                    ${row.name} <a href="asnrm_nurse_pat.jsp?patientID=${param.patientID}&remove=true">Remove</a>
                </c:forEach>
        
        <sql:query var="nurses" dataSource="${snapshot}" scope="request">
            SELECT Persons.ID, Persons.name from Nurses, Persons where Nurses.ID = Persons.ID
        </sql:query>
        
            <h2>Assign a Nurse</h2>
    <form action="asnrm_nurse_pat.jsp">
        <input type="hidden" name="patientID" value="${param.patientID}" />
        <select name="nurseID">
            <option>Select a Nurse</option>
            <c:forEach var="row" items="${nurses.rowsByIndex}">
                <option value="${row[0]}">${row[1]}</option>
            </c:forEach>
        </select>
            <button type="submit">Assign</button>
    </form>
        
        <a href="#" onClick="history.go(-1);return true;">Send Me Back A Page!</a>

    </body>
</html>

