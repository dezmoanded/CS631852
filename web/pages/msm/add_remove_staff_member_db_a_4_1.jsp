<%-- 
    Document   : add_remove_staff_member_db_a_4
    Created on : Apr 27, 2017, 7:32:24 PM
    Author     : bakfark
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Newark Medical Associates(NMA)</title>
    </head>
    <body>
        <h1>Add Surgeon</h1>
        
        
    </body>
    
    <body>
        <form action="add_remove_staff_member_db_a_4_2" method="post">
            <table border="0" cellspacing="2" cellpadding="5">
                <thead>
                    <tr>
                        <th colspan="2">Add Surgeon Data</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td><label>Name</label></td>
                        <td><input type="text" name="name"/></td>
                    </tr>
                    <tr>
                        <td><label>SSN</label></td>
                        <td><input type="text" name="SSN"/></td>
                    </tr>
                    <tr>
                        <td><label>gender</label></td>
                        <td><input type="text" name="gender"/></td>
                    </tr>
                    <tr>
                        <td><label>address</label></td>
                        <td><input type="text" name="address"/></td>
                    </tr>
                    <tr>
                        <td><label>Phone Number</label></td>
                        <td><input type="text" name="phoneNumber"/></td>
                    </tr>
                    <tr>
                        <td><label>Specialty</label></td>
                        <td><input type="text" name="specialty"/></td>
                    </tr>
                    <tr>
                        <td><label>Contract Type</label></td>
                        <td><input type="text" name="contractType"/></td>
                    </tr>
                    <tr>
                        <td><label>Contract Length In Years</label></td>
                        <td><input type="text" name="contractLengthInYears"/></td>
                    </tr>
                    <tr>
                        <td><input type="submit" value="Save" /></td>
                        <td><input type="reset" value="reset"/></td>
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
