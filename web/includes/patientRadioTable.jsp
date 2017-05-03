<%-- 
    Document   : tableTable
    Created on : Apr 29, 2017, 6:41:19 PM
    Author     : paul
--%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<sql:query var="table" dataSource="${snapshot}" scope="request">
    SELECT P.ID, 
        P.SSN, 
        P.name, 
        P.address, 
        P.phoneNumber, 
        TRIM(D.name) as Doctor, 
        TRIM(N.name) as Nurse, 
        DATE_FORMAT(dob, '%Y-%m-%d') AS DOB, 
        bloodType
    FROM Persons P, Patients
    LEFT JOIN Persons D ON Patients.primaryCarePhysicianID = D.ID
    LEFT JOIN Persons N ON Patients.nurseID = N.ID
    WHERE P.ID = Patients.ID
        AND P.name like CONCAT('%', ?, '%')
    
    <sql:param value="${fn:replace(param.name, ' ', '%')}" />
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
            <input type="radio" name="patientID" value="${column}">
            </c:when><c:otherwise>
                <c:out value="${column}"/>
            </c:otherwise></c:choose>
        </td>
    </c:forEach>    
    </tr>
</c:forEach>
</table>