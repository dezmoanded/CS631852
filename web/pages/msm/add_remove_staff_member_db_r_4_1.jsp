<%-- 
    Document   : add_remove_staff_member_db_r_4
    Created on : Apr 27, 2017, 7:32:44 PM
    Author     : bakfark
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Newark Medical Associates(NMA)</title>
    </head>
    <body>
        <h1>Remove Surgeon</h1>
        
        
    </body>
    
    <body>
        <form action="add_remove_staff_member_db_r_4_2.jsp" method="post">
            <table border="0" cellspacing="2" cellpadding="5">
                <thead>
                    <tr>
                        <th colspan="2">Enter Surgeon Name</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td><label>Name</label></td>
                        <td><jsp:include page="/includes/db.jsp" />
                            <sql:query var="surgeons" dataSource="${snapshot}" scope="request">
                                SELECT Persons.ID, Persons.name from Surgeons, Persons where Surgeons.ID = Persons.ID
                            </sql:query>

                            <select name="ID">
                                <option>Select a Surgeon</option>
                                <c:forEach var="row" items="${surgeons.rows}">
                                    <option value="${row.ID}">${row.name}</option>
                                </c:forEach>
                            </select>
                                <button type="submit">Remove</button></td>
                    </tr>
                </tbody>
            </table>
        </form>
         <font color="red"><c:if test="${not empty param.errMsg}">
            <c:out value="${param.errMsg}" />
            <a href="index.jsp">Go Back</a>
        </c:if></font>
        <font color="green"><c:if test="${not empty param.susMsg}">
            <c:out value="${param.susMsg}" />
            <a href="index.jsp">Go Back</a>
        </c:if></font>
 
    </body>

   <a href="#" onClick="history.go(-1);return true;">Send Me Back A Page!</a>
 
    
    
</html>
