<%-- 
    Document   : tableTable
    Created on : Apr 29, 2017, 6:41:19 PM
    Author     : paul
--%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<table  align="left" border="1">
    <!-- column headers -->
    <tr>
    <c:forEach var="columnName" items="${table.columnNames}">
        <th><c:out value="${columnName}"/></th>
    </c:forEach>
    
    </tr>
<!-- column data -->
<c:forEach var="row" items="${table.rowsByIndex}">
    <tr>
    <c:forEach var="column" items="${row}">
        <td><c:out value="${column}"/></td>
    </c:forEach>    
    </tr>
</c:forEach>