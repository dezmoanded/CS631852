<%-- 
    Document   : add_remove_staff_member_db_r_3
    Created on : Apr 27, 2017, 7:32:04 PM
    Author     : bakfark
--%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
    </body>
    
    <body>
    <sql:update dataSource="${dbsource}" var="count">
            DELETE FROM Persons,Employees,SupportStaff
            WHERE Persons.name='${param.name}'
            AND Persons.ID = Employees.ID
            AND SupportStaff.ID = Persons.ID
        </sql:update>
        <c:if test="${count>=1}">
            <font size="5" color='green'> Congratulations ! Data deleted
            successfully.</font>
              <a href="index.jsp">Go Home</a>          
        </c:if>
    </body>
     
</html>
