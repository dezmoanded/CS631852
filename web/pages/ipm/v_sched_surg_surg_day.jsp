<%-- 
    Document   : v_sched_surg_surg_day
    Created on : Apr 19, 2017, 12:48:13 PM
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
        
        <jsp:include page="/includes/head.jsp" />
    </head>
    <body>
        <h1>View scheduled surgery per surgeon and per day</h1>
        
        <h2>Filter by date range</h2>
                <form action="v_sched_surg_surg_day.jsp" method="post">
                    From 
                    <input type="hidden" name="patientID" value="${param.patientID}"/>
        <div class="input-group date"><input type="text" id="from" name="from" class="form-control" value="${param.from}"/>
                        <span class="input-group-addon">
                        <span class="glyphicon glyphicon-calendar"></span>
                        </span></div>
        
                        To 
        <div class="input-group date"><input type="text" id="to" name="to" class="form-control" value="${param.to}"/>
                        <span class="input-group-addon">
                        <span class="glyphicon glyphicon-calendar"></span>
                        </span></div>
        
        <script type="text/javascript">
            $(document).ready(function() {
                $('.date').datetimepicker({format: "YYYY-MM-DD hh:mm"});

                $("input[type=reset]").on('click', function(e){
                    e.preventDefault();
                    $('input[type=text]').val('');
                });
            });
        </script>
        
        <c:set var="from" value="'${param.from}'" />
        <c:set var="to" value="'${param.to}'"/>
        <c:if test="${empty param.from}">
            <c:set var="from" value="NOW()" />
        </c:if>
        <c:if test="${empty param.to}">
            <c:set var="to" value="NOW()" />
        </c:if>
        
        <jsp:include page="/includes/db.jsp" />
        
        <sql:query var="doctors" dataSource="${snapshot}" scope="request">
            SELECT Persons.ID, Persons.name from Surgeons, Persons where Surgeons.ID = Persons.ID
        </sql:query>
            
        <select name="doctorID">
            <option>Select a Surgeon</option>
            <c:forEach var="row" items="${doctors.rowsByIndex}">
                <option value="${row[0]}">${row[1]}</option>
            </c:forEach>
        </select>
            
        <button type="submit">Go</button>
        </form>
        
        <c:if test="${!empty param.doctorID}">
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
                    and SurgerySchedule.when >= ${from}
                    and SurgerySchedule.when <= ${to}
                    and Surgeons.Id = ${param.doctorID}
            </sql:query>

            <jsp:include page="/includes/tableTable.jsp"/>
        </c:if>
        
        <a href="#" onClick="history.go(-1);return true;">Send Me Back A Page!</a>

    </body>
</html>
