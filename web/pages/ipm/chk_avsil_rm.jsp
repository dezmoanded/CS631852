<%-- 
    Document   : chk_avsil_rm
    Created on : Apr 19, 2017, 12:45:02 PM
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
        <h1>Check for available rooms</h1>
        <form method="post">
            From 
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
        
        <c:set var="sqt" value="'"/>
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
                                    and ((V.dateOfAdmission < ${from} and V.dateLeft > ${from})
                                        or (V.dateOfAdmission < ${to} and V.dateLeft > ${to}))
                                    and V.bedNumber = 0)
            UNION
            SELECT R.roomNum as roomNum, R.wing as wing, C.clinicName as clinicName, 1 as bed
                        from Room R, Clinics C
                        where C.ID = R.clinicID
                            and not exists (
                                SELECT * from Visits V 
                                where V.roomID = R.ID
                                    and ((V.dateOfAdmission < ${from} and V.dateLeft > ${from})
                                        or (V.dateOfAdmission < ${to} and V.dateLeft > ${to}))
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
                            room.html(room.html() + "<div>${bed.bed == 0 ? 'A' : 'B'}</div>");
                        </c:forEach>
                    })
                </script>
        <a href="#" onClick="history.go(-1);return true;">Send Me Back A Page!</a>
    </body>
</html>
