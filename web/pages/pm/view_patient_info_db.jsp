<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%-- 
    Document   : view_patient_info
    Created on : Apr 19, 2017, 12:52:02 PM
    Author     : bakfark
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Newark Medical Associates(NMA)</title>
    </head>
    <body>
        <h1>View Patient Information</h1>
        
        <jsp:include page="/includes/db.jsp" />
<sql:query var="table" dataSource="${snapshot}" scope="request">
    SELECT Persons.ID, 
        SSN, 
        name, 
        address, 
        phoneNumber, 
        primaryCarePhysicianID, nurseID, 
        dob, 
        bloodType
    FROM Persons, Patients
    WHERE Persons.ID = Patients.ID
    AND name like CONCAT('%', ?, '%');
    <sql:param value="${fn:replace(param.name, ' ', '%')}" />
</sql:query>
    
    <c:import url="/includes/tableTable.jsp" />
        <br><br>
    <a href="#" onClick="history.go(-1);return true;">Send Me Back A Page!</a>
     </body>
  </html>  
    
    

