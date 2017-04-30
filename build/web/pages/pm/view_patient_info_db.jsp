<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
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
        

    </body>



<sql:query var="patient1" dataSource="jdbc/HospitalDatabase">
    SELECT Persons.ID, SSN, name, address, phoneNumber, primaryCarePhysicianID, nurseID, dob, bloodType
    FROM Persons, Patients
    WHERE Persons.ID = Patients.ID
    AND name = ?  <sql:param value="${param.name}" />
</sql:query>
    
    <c:import url="/includes/tableTable.jsp">
        <c:param name="table" value="test" />
    </c:import>
    
  
        
   
        
        <br><br>
        
    <a href="#" onClick="history.go(-1);return true;">Send Me Back A Page!</a>
  </html>  
    
    

