<%-- 
    Document   : asnrm_doc_pat
    Created on : Apr 19, 2017, 12:46:38 PM
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
        <h1>Assign/Remove a Doctor</h1>
        
        <jsp:include page="/includes/db.jsp" />
        
        <c:if test="${!empty param.remove}">
            <sql:update dataSource="${snapshot}">
                UPDATE Patients set primaryCarePhysicianID = NULL where ID = ${param.patientID}
            </sql:update>
        </c:if>
                
        <c:if test="${!empty param.doctorID}">
            <sql:update dataSource="${snapshot}">
                UPDATE Patients set primaryCarePhysicianID = ${param.doctorID} where ID = ${param.patientID}
            </sql:update>
        </c:if>
        
        <sql:query var="table" dataSource="${snapshot}">
            SELECT Persons.ID, Persons.name 
            from Persons, Patients
            where Persons.ID = Patients.primaryCarePhysicianID
                and Patients.ID = ${param.patientID}
        </sql:query>
                <h2>Doctor currently assigned to Patient</h2>
                <c:forEach var="row" items="${table.rows}">
                    ${row.name} <a href="asnrm_doc_pat.jsp?patientID=${param.patientID}&remove=true">Remove</a>
                </c:forEach>
        
        <sql:query var="doctors" dataSource="${snapshot}" scope="request">
            SELECT Persons.ID, Persons.name from Physicians, Persons where Physicians.ID = Persons.ID
        </sql:query>
        
            <h2>Assign a Doctor</h2>
    <form action="asnrm_doc_pat.jsp">
        <input type="hidden" name="patientID" value="${param.patientID}" />
        <select name="doctorID">
            <option>Select a Doctor</option>
            <c:forEach var="row" items="${doctors.rowsByIndex}">
                <option value="${row[0]}">${row[1]}</option>
            </c:forEach>
        </select>
            <button type="submit">Assign</button>
    </form>
        
        <a href="#" onClick="history.go(-1);return true;">Send Me Back A Page!</a>

    </body>
</html>
