<%-- 
    Document   : head
    Created on : Apr 28, 2017, 10:52:43 PM
    Author     : paul
--%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<link rel="stylesheet" href="<c:url value="/css/bootstrap.min.css" />">
<link rel="stylesheet" href="<c:url value="/css/bootstrap-theme.min.css" />">
<link rel="stylesheet" href="<c:url value="/css/bootstrap-datetimepicker-standalone.css" />">
<script src="<c:url value="/js/jquery-3.2.1.js" />"></script>
<script src="<c:url value="/js/bootstrap.min.js" />"></script>
<script src="<c:url value="/js/bootstrap.js" />"></script>
<script src="<c:url value="/js/moment.min.js" />"></script>
<script src="<c:url value="/js/bootstrap-datetimepicker.min.js" />"></script>

<style>
    body {
        padding: 16px;
    }
    .dataTable th, .dataTable td {
        border: black 1px solid;
    }
    th, td {
        padding: 4px;
    }
    a {
        padding: 8px;
        background-color: rgba(255, 235, 205, 0.63);
        margin: 8px;
        display: inline-block;
    }
    
    #clinics div {
        display: inline-block;
        padding: 8px;
    }
    #clinics div .t {
        background-color: rgba(222, 184, 135, 0.81);
    }
    #clinics div div .t {
        background-color: rgba(135, 222, 184, 0.81);
    }
    #clinics div div div .t {
        background-color: rgba(184, 135, 222, 0.81);
        font-weight: bold;
    }
    #clinics > div > div > div:not(.t) {
        border: 1px solid rgba(184, 135, 222, 0.81);
        padding: 0px;
        margin: 8px;
    }
    #clinics > div > div > div {

    }
    .t {
        width: 100%;
    }
</style>