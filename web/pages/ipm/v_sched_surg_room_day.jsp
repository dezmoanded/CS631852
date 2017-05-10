<%-- 
    Document   : v_sched_surg_room_day
    Created on : Apr 19, 2017, 12:47:35 PM
    Author     : bakfark
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Newark Medical Associates(NMA)</title>
        
        <jsp:include page="/includes/head.jsp" />
    </head>
    <body>
        <h1>View scheduled surgery per room and per day</h1>
        
        <h2>Filter by date range</h2>
                <form action="v_sched_surg_room_day.jsp" method="post">
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
            
            <button type="submit">Apply</button>
        </form>
        
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
        <sql:query var="beds" dataSource="${snapshot}">
            SELECT R.roomNum as roomNum, R.wing as wing, C.clinicName as clinicName
                        from Room R, Clinics C
                        where C.ID = R.clinicID
                            and exists (
                                SELECT * from SurgerySchedule S 
                                where S.theatreID = R.ID
                                    and S.when >= ${from}
                                    and S.when <= ${to})
        </sql:query>
            <div id="clinics"></div>
                <script>
                    $(document).ready(function(){
                        <c:forEach var="bed" items="${beds.rows}">
                            if ($("#clinics #${fn:replace(bed.clinicName, ' ', '_')}").length == 0){
                                $("#clinics").html($("#clinics").html() 
                                        + "<div id='${fn:replace(bed.clinicName, ' ', '_')}'><div class='t'>${bed.clinicName}</div></div>");
                            }
                            clinic = $("#${fn:replace(bed.clinicName, ' ', '_')}");
                            if (clinic.find(".wing${bed.wing}").length == 0){
                                clinic.html(clinic.html() 
                                        + "<div class='wing${bed.wing}'><div class='t'>Wing ${bed.wing}</div></div>");
                            }
                            wing = clinic.find(".wing${bed.wing}");
                            if (wing.find(".room${bed.roomNum}").length == 0){
                                wing.html(wing.html() 
                                        + "<div class='room${bed.roomNum}'><div class='t'>Room ${bed.roomNum}</div></div>");
                            }
                            room = wing.find(".room${bed.roomNum}");
                            room.html(room.html() + "<div><a href='v_sched_surg_room_day.jsp?from=${param.from}&to=${param.to}&bed=${bed.bed}&room=${bed.roomNum}&wing=${bed.wing}'>Check</div>");
                        </c:forEach>
                    })
                </script>
                
                <c:if test="${!empty param.room && !empty param.wing}">
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
                            and Room.roomNum = ${param.room}
                            and Room.wing = ${param.wing}
                            and SurgerySchedule.when >= ${from}
                            and SurgerySchedule.when <= ${to}
                    </sql:query>
                            
                    <jsp:include page="/includes/tableTable.jsp"/>
                </c:if>
        
        <a href="#" onClick="history.go(-1);return true;">Send Me Back A Page!</a>

    </body>
</html>
