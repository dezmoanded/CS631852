<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- 
    Document   : insert_patient
    Created on : Apr 19, 2017, 12:51:33 PM
    Author     : bakfark
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Newark Medical Associates(NMA)</title>
    </head>
    <body>
        <h1>Insert Patient</h1>

<c:if test="${ empty param.name or empty param.SSN or empty param.gender or empty param.address or empty param.phoneNumber}">
            <c:redirect url="insert_patient.jsp" >
                <c:forEach var="par" items="${param}">
                    <c:param name="${par.key}" value="${par.value}"/>
                </c:forEach>
                <c:param name="errMsg" value="Please Enter Patient Data" />
            </c:redirect>
 
        </c:if>
        
<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
     url="jdbc:mysql://localhost/cs631"
     user="root"  password="go"/>



<sql:update var="patient" dataSource="${snapshot}">
    INSERT INTO Persons (name, SSN, gender, address, phoneNumber)
    VALUES (?,?,?,?,?);
    <sql:param value="${param.name}" />
    <sql:param value="${param.SSN}" />
    <sql:param value="${param.gender}" />
    <sql:param value="${param.address}" />
    <sql:param value="${param.phoneNumber}" />
</sql:update>
    
    <sql:update var="patient" dataSource="${snapshot}">
        INSERT INTO Patients (ID, primaryCarePhysicianID,nurseID,dob,bloodType)
        SELECT ID, null,null,?,? from Persons order by ID DESC limit 1
        <%--<sql:param value="${param.primaryCarePhysicianID}" />
        <sql:param value="${param.nurseID}" />--%>
        <sql:param value="${param.dob}" />
        <sql:param value="${param.bloodType}" />
    </sql:update>

        
        <a href="#" onClick="history.go(-1);return true;">Send Me Back A Page!</a>
<c:if test="${result>=1}">
            <font size="5" color='green'> Congratulations ! Data inserted
            successfully.</font>
 
            <c:redirect url="insert_patient.jsp" >
                <c:param name="susMsg" value="Congratulations ! Data inserted
            successfully." />
            </c:redirect>
        </c:if> 
    </body>
</html>
