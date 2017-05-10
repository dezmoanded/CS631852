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
            <th align="left" ><font size="+2">In-Patient Management</font></th></DIV>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td><a href="ipm/chk_avsil_rm.jsp">Check for available room/bed</a></td>
                </tr>
                <tr>
                    <td><a href="ipm/view_patient_info.jsp">View Patient Info</a></td>
                </tr>
<!--                <tr>
                    <td><a href="ipm/asnrm_pat_rm.jsp">Assign/Remove a patient to a room/bed</a></td>
                </tr>
                <tr>
                    <td><a href="ipm/asnrm_doc_pat.jsp">Assign/Remove a doctor to a patient</a></td>
                </tr>
                <tr>
                    <td><a href="ipm/asnrm_nurse_pat.jsp">Assign/Remove a nurse to a patient</a></td>
                </tr>-->
                <tr>
                    <td><a href="ipm/v_sched_surg_room_day.jsp">View scheduled surgery per room and per day</a></td>
                </tr>
                <tr>
                    <td><a href="ipm/v_sched_surg_surg_day.jsp">View scheduled surgery per surgeon and per day</a></td>
                </tr>
<!--                <tr>
                    <td><a href="ipm/book_surg.jsp">Book a surgery</a></td>
                </tr>-->
<!--                <tr>
                    <td><a href="ipm/v_sched_surg_pat.jsp">View scheduled surgery per patient</a></td>
                </tr>-->
                <tr>
                    <td></td>
                </tr>
            </tbody>
        </table>
<a href="#" onClick="history.go(-1);return true;">Send Me Back A Page!</a>
    </body>
</html>
