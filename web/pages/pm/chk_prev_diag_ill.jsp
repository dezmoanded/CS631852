<%-- 
    Document   : chk_prev_diag_ill
    Created on : Apr 19, 2017, 12:52:51 PM
    Author     : bakfark
--%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Newark Medical Associates(NMA)</title>
        
        <jsp:include page="/includes/head.jsp" />
    </head>
    <body>
        <h1>Diagnoses</h1>
        
        <jsp:include page="/includes/db.jsp" />
        <sql:query var="table" dataSource="${snapshot}" scope="request">
            SELECT I.CODE, 
                TRIM(I.description) As Description, 
                TRIM(P.name) AS Doctor, 
                DATE_FORMAT(C.when, '%Y-%m-%d') AS Date 
            FROM IllnessesPerPatient IPP, Illness I, Consultation C, Persons P
            WHERE IPP.patientID = ? 
                and IPP.consultationID = C.ID 
                and I.ID = IPP.illnessID 
                and P.ID = C.physicianID
            <sql:param value="${param.patientID}"/>
        </sql:query>
            
            <jsp:include page="/includes/tableTable.jsp"/>
        
        <a href="#" onClick="history.go(-1);return true;">Send Me Back A Page!</a>
    </body>
</html>
