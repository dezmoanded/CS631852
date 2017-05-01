<%-- 
    Document   : view_patient_info
    Created on : Apr 20, 2017, 2:31:41 AM
    Author     : bakfark
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Newark Medical Associates(NMA)</title>
        
        <jsp:include page="/includes/head.jsp" />
    </head>
    <body>
        <h1>View Patient Information</h1>
        
        
    </body>
    
    <body>
        <form action="view_patient_info_db.jsp" method="post">
            <table border="0" cellspacing="2" cellpadding="5">
                <thead>
                    <tr>
                        <th colspan="3">Enter Patient Name</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td><label>Name</label></td>
                        <td><input type="text" name="name"/></td>
                        <td><button type="submit">Find Patient</button></td>
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