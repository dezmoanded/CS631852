<%-- 
    Document   : v_sched_surg_pat
    Created on : Apr 19, 2017, 12:49:14 PM
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
        <h1>Surgery Schedule</h1>
        
        <jsp:include page="/includes/db.jsp" />
        <sql:query var="table" dataSource="${snapshot}" scope="request">
            SELECT TRIM(P.name) AS Patient, 
                TRIM(D.name) AS Surgeon, 
                DATE_FORMAT(SurgerySchedule.when, '%Y-%m-%d %h:%i') AS Date,
                roomNum,
                wing,
                clinicID
            FROM Persons P, 
                Persons D, 
                Patients, 
                Surgeons, 
                SurgerySchedule,
                Room
            WHERE Patients.ID = SurgerySchedule.patientID
                and Surgeons.ID = SurgerySchedule.surgeonID
                and P.ID = Patients.ID
                and D.ID = Surgeons.ID
                and SurgerySchedule.theatreID = Room.ID
                and Patients.ID = ?
            <sql:param value="${param.patientID}"/>
        </sql:query>
            
            <jsp:include page="/includes/tableTable.jsp"/>
        <a href="#" onClick="history.go(-1);return true;">Send Me Back A Page!</a>

    </body>
</html>
