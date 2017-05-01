<%-- 
    Document   : schedule_appt
    Created on : Apr 19, 2017, 12:52:23 PM
    Author     : bakfark
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
        <h1>Schedule an Appointment</h1>
        
        <jsp:include page="/includes/db.jsp" />
        <c:choose>
            <c:when test="${!(empty param.patientID || empty param.doctorID || empty param.time)}">
                <sql:update dataSource="${snapshot}">
                    INSERT into Consultation (patientID, physicianID, `when`)
                    VALUES (?, ?, ?)
                    <sql:param value="${param.patientID}"/>
                    <sql:param value="${param.doctorID}"/>
                    <sql:param value="${param.time}"/>
                </sql:update>
                    
                Appointment Saved.
            </c:when>
            <c:otherwise>
                <form target="schedule_appt.jsp">
                    <input type="hidden" name="patientID" value="${param.patientID}"/>
                <sql:query var="table" dataSource="${snapshot}" scope="request">
            SELECT SSN, 
                name, 
                address, 
                phoneNumber, 
                DATE_FORMAT(dob, '%Y-%m-%d') AS DOB, 
                bloodType
            FROM Persons, Patients
            WHERE Persons.ID = Patients.ID
            AND Patients.ID = ?;
            <sql:param value="${param.patientID}" />
        </sql:query>
    
        <c:import url="/includes/tableTable.jsp" />

        <sql:query var="doctors" dataSource="${snapshot}" scope="request">
            SELECT Persons.ID, Persons.name from Physicians, Persons where Physicians.ID = Persons.ID
        </sql:query>
        
        Select a Doctor
        <select name="doctorID">
            <option>Select a Doctor</option>
            <c:forEach var="row" items="${doctors.rowsByIndex}">
                <option value="${row[0]}">${row[1]}</option>
            </c:forEach>
        </select>
        
        Appointment Time
        <div class="input-group date"><input type="text" name="time" class="form-control"/>
                        <span class="input-group-addon">
                        <span class="glyphicon glyphicon-calendar"></span>
                        </span></div>
        
        <button type="submit">Save Appointment</button>
                </form>
            </c:otherwise>
        </c:choose>
        
        
        
            <br><br>
            <a href="#" onClick="history.go(-1);return true;">Send Me Back A Page!</a>

        <script type="text/javascript">
            $(document).ready(function() {
                $('.date').datetimepicker({format: "YYYY-MM-DD hh:mm"});
    //            $('.date').datetimepicker('setDate', new Date(2000, 11, 24));
    //            $('.date').datetimepicker('update');
    //            $('.date').val('');

                $("input[type=reset]").on('click', function(e){
                    e.preventDefault();
                    $('input[type=text]').val('');
                });
            });
        </script>
    </body>
</html>
