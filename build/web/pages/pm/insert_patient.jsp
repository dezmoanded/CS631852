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
        
        <jsp:include page="/includes/head.jsp" />
    </head>
    <body>
        <h1>Insert Patient</h1>
        
        
    </body>
    
    <body>
        <form action="insert_patient_db.jsp" method="post">
            <table border="0" cellspacing="2" cellpadding="5">
                <thead>
                    <tr>
                        <th colspan="2">Insert Patient Data</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td><label>Name</label></td>
                        <td><input type="text" name="name" value="${param.name}"/></td>
                    </tr>
                    <tr>
                        <td><label>SSN</label></td>
                        <td><input type="text" name="SSN" value="${param.SSN}"/></td>
                    </tr>
                    <tr>
                        <td><label>gender</label></td>
                        <td><input type="text" name="gender" value="${param.gender}"/></td>
                    </tr>
                    <tr>
                        <td><label>address</label></td>
                        <td><input type="text" name="address" value="${param.address}"/></td>
                    </tr>
                    <tr>
                        <td><label>Phone Number</label></td>
                        <td><input type="text" name="phoneNumber" value="${param.phoneNumber}"/></td>
                    </tr>
                    <tr>
                        <td><label>Primary Care Physician ID</label></td>
                        <td><input type="text" name="primaryCarePhysicianID" value="${param.primaryCarePhysicianID}"/></td>
                    </tr>
                    <tr>
                        <td><label>Nurse ID</label></td>
                        <td><input type="text" name="nurseID" value="${param.nurseID}"/></td>
                    </tr>
                    <tr>
                        <td><label>Date of Birth</label></td>
                        <td class="input-group date"><input type="text" name="dob" value="${param.dob}" class="form-control"/>
                        <span class="input-group-addon">
                        <span class="glyphicon glyphicon-calendar"></span>
                        </span></td>
                    </tr>
                    <tr>
                        <td><label>Blood Type</label></td>
                        <td><input type="text" name="bloodType" value="${param.bloodType}"/></td>
                    </tr>
                    <tr>
                        <td><input type="submit" value="Save" /></td>
                        <td><input type="reset" value="reset" /></td>
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
 
    <script type="text/javascript">
        $(document).ready(function() {
            $('.date').datetimepicker({format: "YYYYMMDD"});
//            $('.date').datetimepicker('setDate', new Date(2000, 11, 24));
//            $('.date').datetimepicker('update');
//            $('.date').val('');
            
            $("input[type=reset]").on('click', function(e){
                e.preventDefault();
                $('input[type=text]').val('');
            });
        });
    </script>
    
</html>