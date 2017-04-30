<%-- 
    Document   : insert_patient
    Created on : Apr 19, 2017, 11:57:51 PM
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
        <h1>Add Support Staff</h1>
        
        
    </body>
    
    <body>
        <form action="add_remove_staff_member_db_a_3_2" method="post">
            <table border="0" cellspacing="2" cellpadding="5">
                <thead>
                    <tr>
                        <th colspan="2">Add Support Staff Data</th>
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
                        <td><label>Salary</label></td>
                        <td><input type="text" name="surgeryType"/></td>
                    </tr>
                    <tr>
                        <td><label>Employee Number</label></td>
                        <td><input type="text" name="grade"/></td>
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