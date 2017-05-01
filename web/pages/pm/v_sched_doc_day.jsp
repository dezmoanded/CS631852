<%-- 
    Document   : v_sched_doc_day
    Created on : Apr 19, 2017, 12:53:26 PM
    Author     : bakfark
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Newark Medical Associates(NMA)</title>
        
        <jsp:include page="/includes/head.jsp" />
    </head>
    <body>
        <h1>Appointment Schedule</h1>
        
        <jsp:include page="/includes/db.jsp" />
        <sql:query var="table" dataSource="${snapshot}" scope="request">
            SELECT TRIM(A.name) AS Patient, 
                TRIM(B.name) AS Doctor, 
                DATE_FORMAT(Consultation.when, '%Y-%m-%d %h:%i') AS Date
            FROM Persons A, Persons B, Patients, Physicians, Consultation
            WHERE Patients.ID = Consultation.patientID
                and Physicians.ID = Consultation.physicianID
                and A.ID = Patients.ID
                and B.ID = Physicians.ID
                and Patients.ID = ?
            <sql:param value="${param.patientID}"/>
        </sql:query>
            
            <jsp:include page="/includes/tableTable.jsp"/>
        <a href="#" onClick="history.go(-1);return true;">Send Me Back A Page!</a>

    </body>
</html>
