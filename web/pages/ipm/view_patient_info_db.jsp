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

    
    <c:import url="/includes/patientRadioTable.jsp" />
        <br><br>
        
        <a href="javascript:goTo('asnrm_pat_rm')">Assign/Remove a patient to a room/bed</a>
        <a href="javascript:goTo('asnrm_doc_pat')">Assign/Remove a doctor to a patient</a>
        <a href="javascript:goTo('asnrm_nurse_pat')">Assign/Remove a nurse to a patient</a>
        <a href="javascript:goTo('v_sched_surg_pat')">View Surgery Schedule</a>
        
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
    
    

