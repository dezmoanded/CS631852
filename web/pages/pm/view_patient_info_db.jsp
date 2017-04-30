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
        
        <jsp:include page="/includes/head.jsp" />
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
        
        <a href="javascript:goTo('schedule_appt')">Schedule Appointment</a>
        <a href="javascript:goTo('chk_prev_diag_ill')">Check Previous Diagnoses and Illnesses</a>
        <a href="javascript:goTo('v_sched_doc_day')">View Scheduled Per Doctor and Per Day</a>
        
        <div><a href="#" onClick="history.go(-1);return true;">Send Me Back A Page!</a></div>
        
        <script>
            function goTo(page){
                if($("input[name=patientID]:checked").val()==undefined){
                    alert("Select a Patient");
                } else
                    window.location.href = page+".jsp?patientID="+$("input[name=patientID]:checked").val()
            }
        </script>
     </body>
  </html>  
    
    

