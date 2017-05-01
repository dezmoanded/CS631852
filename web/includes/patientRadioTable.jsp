<%-- 
    Document   : tableTable
    Created on : Apr 29, 2017, 6:41:19 PM
    Author     : paul
--%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<table>
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