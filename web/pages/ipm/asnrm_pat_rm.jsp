<%-- 
    Document   : asnrm_pat_rm
    Created on : Apr 19, 2017, 12:45:41 PM
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
        <h1>Assign/Remove a patient to a room/bed</h1>
        
        <jsp:include page="/includes/db.jsp" />
        
        <c:if test="${!empty param.remove}">
            <sql:update dataSource="${snapshot}">
                UPDATE Visits set dateLeft = NOW() where ID = ${param.remove}
            </sql:update>
        </c:if>
                
        <c:set var="from" value="'${param.from}'" />
        <c:set var="to" value="'${param.to}'"/>
        <c:if test="${empty param.from}">
            <c:set var="from" value="NOW()" />
        </c:if>
        <c:if test="${empty param.to}">
            <c:set var="to" value="NOW()" />
        </c:if>
                
                <c:if test="${!empty param.patientID 
                              && !empty param.bed 
                              && !empty param.room 
                              && !empty param.wing}">
                    <sql:update dataSource="${snapshot}">
                        INSERT into Visits (patientID, roomID, nursingUnit, bedNumber, dateOfAdmission, dateLeft)
                        SELECT ${param.patientID}, R.ID, 0, ${param.bed}, ${from}, ${to}
                        FROM Room R
                        WHERE R.roomNum = ${param.room}
                            and R.wing = ${param.wing}
                    </sql:update>
                </c:if>
        
        <sql:query var="table" dataSource="${snapshot}">
            SELECT V.bedNumber, R.roomNum, R.wing, C.clinicName, V.ID, V.dateOfAdmission
            FROM Visits V, Room R, Clinics C
            WHERE V.patientID = ${param.patientID}
                and V.roomID = R.ID
                and C.ID = R.clinicID
                and V.dateLeft > NOW()
        </sql:query>
                <h2>Remove Patient from Room</h2>
                <table>
                    <tr>
                        <th>Bed</th>
                        <th>Room</th>
                        <th>Wing</th>
                        <th>Clinic</th>
                        <th>Date of Admission</th>
                        <th></th>
                    </tr>
                <c:forEach var="row" items="${table.rows}">
                    <tr>
                        <td>${row.bedNumber == 0 ? 'A' : 'B'}</td>
                        <td>${row.roomNum}</td>
                        <td>${row.wing}</td>
                        <td>${row.clinicName}</td>
                        <td>${row.dateOfAdmission}</td>
                        <td><a href="asnrm_pat_rm.jsp?patientID=${param.patientID}&remove=${row.ID}">Remove</a></td>
                    </tr>
                </c:forEach>
                </table>
                
                <h2>Assign Patient to Room</h2>
                <form action="asnrm_pat_rm.jsp?patientID=${param.patientID}" method="post">
                    From 
                    <input type="hidden" name="patientID" value="${param.patientID}"/>
        <div class="input-group date"><input type="text" name="from" class="form-control" value="${param.from}"/>
                        <span class="input-group-addon">
                        <span class="glyphicon glyphicon-calendar"></span>
                        </span></div>
        
                        To 
        <div class="input-group date"><input type="text" name="to" class="form-control" value="${param.to}"/>
                        <span class="input-group-addon">
                        <span class="glyphicon glyphicon-calendar"></span>
                        </span></div>
            
            <button type="submit">Check rooms</button>
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
            SELECT roomNum, wing, clinicName, bed from (
            SELECT R.roomNum as roomNum, R.wing as wing, C.clinicName as clinicName, 0 as bed
                        from Room R, Clinics C
                        where C.ID = R.clinicID
                            and not exists (
                                SELECT * from Visits V 
                                where V.roomID = R.ID
                                    and ((V.dateOfAdmission <= ${from} and V.dateLeft >= ${from})
                                        or (V.dateOfAdmission <= ${to} and V.dateLeft >= ${to}))
                                    and V.bedNumber = 0)
            UNION
            SELECT R.roomNum as roomNum, R.wing as wing, C.clinicName as clinicName, 1 as bed
                        from Room R, Clinics C
                        where C.ID = R.clinicID
                            and not exists (
                                SELECT * from Visits V 
                                where V.roomID = R.ID
                                    and ((V.dateOfAdmission <= ${from} and V.dateLeft >= ${from})
                                        or (V.dateOfAdmission <= ${to} and V.dateLeft >= ${to}))
                                    and V.bedNumber = 1)
            ) O group by clinicName, wing, roomNum, bed
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
                            room.html(room.html() + "<div><a href='asnrm_pat_rm.jsp?patientID=${param.patientID}&from=${param.from}&to=${param.to}&bed=${bed.bed}&room=${bed.roomNum}&wing=${bed.wing}'>${bed.bed == 0 ? 'A' : 'B'}</a></div>");
                        </c:forEach>
                    })
                </script>
        
        <a href="#" onClick="history.go(-1);return true;">Send Me Back A Page!</a>

    </body>
</html>
