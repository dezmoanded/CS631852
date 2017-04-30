<%-- 
    Document   : db
    Created on : Apr 29, 2017, 10:51:04 PM
    Author     : paul
--%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
     url="jdbc:mysql://localhost/cs631"
     user="root"  password="go" scope="request"/>
