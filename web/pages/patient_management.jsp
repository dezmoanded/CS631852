<%-- 
    Document   : patient_management
    Created on : Apr 19, 2017, 4:08:37 AM
    Author     : bakfark
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Newark Medical Associates(NMA)</title>
    </head>
    <body>
        <h1>Newark Medical Associates(NMA)</h1><table border="0">
            <thead>
                <tr>
            <th align="left"><font size="+2">Patient Management</font></th></DIV>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td><a href="pm/insert_patient.jsp">Insert a new patient</a></td>
                </tr>
                <tr>
                    <td><a href="pm/view_patient_info.jsp">View patient information</a></td>
                </tr>
                <tr>
                    <td><a href="pm/schedule_appt.jsp">Schedule an appointment with a doctor</a></td>
                </tr>
                <tr>
                    <td><a href="pm/chk_prev_diag_ill.jsp">Check previous diagnosis or illness</a></td>
                </tr>
                <tr>
                    <td><a href="pm/v_sched_doc_day.jsp">View scheduled per doctor per day</a></td>
                </tr>
                <tr>
                    <td></td>
                </tr>
            </tbody>
        </table>
<a href="#" onClick="history.go(-1);return true;">Send Me Back A Page!</a>
    </body>
</html>
