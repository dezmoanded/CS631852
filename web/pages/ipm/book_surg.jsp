<%-- 
    Document   : book_surg
    Created on : Apr 19, 2017, 12:48:44 PM
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
        <h1>Book a Surgery</h1>
        
        <jsp:include page="/includes/db.jsp" /> 
        <c:if test="${!empty param.patientID 
                      && !empty param.time 
                      && !empty param.roomID 
                      && !empty param.doctorID 
                      && !empty param.surgeryTypeID}">
            <sql:update dataSource="${snapshot}">
                INSERT into SurgerySchedule (theatreID, surgeonID, `when`, patientID, surgeryTypeID)
                values (${param.roomID}, 
                    ${param.doctorID}, 
                    '${param.time}', 
                    ${param.patientID}, 
                    ${param.surgeryTypeID})
            </sql:update>
                
            Surgery scheduled successfully!
        </c:if>
        
        <form action="book_surg.jsp?patientID=${param.patientID}" method="post">
                    Time
        <div class="input-group date"><input type="text" name="time" class="form-control" value="${param.from}"/>
                        <span class="input-group-addon">
                        <span class="glyphicon glyphicon-calendar"></span>
                        </span></div>
        
        <sql:query var="table" dataSource="${snapshot}" scope="request">
            SELECT * from Room, OperatingTheatre where Room.ID = OperatingTheatre.roomID
        </sql:query>

        <table class="dataTable">
            <!-- column headers -->
            <tr>
            <c:forEach var="columnName" items="${table.columnNames}">
                <th><c:out value="${columnName}"/></th>
            </c:forEach>

            </tr>
        <!-- column data -->
        <c:forEach var="row" items="${table.rowsByIndex}">
            <tr>
            <c:forEach var="column" items="${row}" varStatus="loop">
                <td><c:choose><c:when test="${loop.index == 0}">
                    <input type="radio" name="roomID" value="${column}">
                    </c:when><c:otherwise>
                        <c:out value="${column}"/>
                    </c:otherwise></c:choose>
                </td>
            </c:forEach>    
            </tr>
        </c:forEach>
        </table>
        
        <sql:query var="doctors" dataSource="${snapshot}" scope="request">
            SELECT Persons.ID, Persons.name from Surgeons, Persons where Surgeons.ID = Persons.ID
        </sql:query>
            
        <select name="doctorID">
            <option>Select a Surgeon</option>
            <c:forEach var="row" items="${doctors.rowsByIndex}">
                <option value="${row[0]}">${row[1]}</option>
            </c:forEach>
        </select>
            
        <sql:query var="surgeryTypes" dataSource="${snapshot}" scope="request">
            SELECT ID, nameCategory from SurgeryType
        </sql:query>

        <select name="surgeryTypeID">
            <option value="">Select a Surgery Type</option>
            <c:forEach var="row" items="${surgeryTypes.rows}">
                <option value="${row.ID}">${row.nameCategory}</option>
            </c:forEach>
        </select>
            
            <button type="submit">Book Surgery</button>
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
        
        <a href="#" onClick="history.go(-1);return true;">Send Me Back A Page!</a>

    </body>
</html>
