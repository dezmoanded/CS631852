<%-- 
    Document   : v_staff_mem_per_job_type
    Created on : Apr 19, 2017, 12:50:16 PM
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
        <h1>View Staff Per Jobtype</h1>   
    </body>
    
     <body>
        <form method="post" action="v_staff_mem_per_job_type_db.jsp" name="productForm">
            <select name="colour" id="dropdown">
                <option value="dropdown">Pls select one</option>
                <option value="surgeon">Surgeon</option>
                <option value="nurse">Nurse</option>
                <option value="staff">Staff</option>
                <option value="physician">Physician</option>
            </select>
            <input type="submit" value="click">
        </form>
        <%
        String colour = request.getParameter("colour");
     //   out.println(colour);
        %>
         <%
   session.setAttribute( "colour", colour );
%>
        <%--script>
        document.getElementById("dropdown").value = '<% out.print(colour);%>'
        <script--%>
        
    </body>
    
      <body>
        <%--form action="v_staff_mem_per_job_type_db.jsp" method="post">
            <table border="0" cellspacing="2" cellpadding="5">
                <thead>
                    <tr>
                        <th colspan="2">Enter Staff Jobtype</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td><label>Jobtype(Staff, Physician,Surgeon,Nurse)</label></td>
                        <td><input type="text" name="jobtype"/></td>
                    </tr>
                </tbody>
            </table>
        </form--%>
         <%--font color="red"><c:if test="${not empty param.errMsg}">
            <c:out value="${param.errMsg}" />
            <br><br>
            <a href="index.jsp">Go Back</a>
        </c:if></font--%>
        <%--font color="green"><c:if test="${not empty param.susMsg}">
            <c:out value="${param.susMsg}" />
            <br><br>
            <a href="index.jsp">Go Back</a>
        </c:if></font--%>
 
    </body>

    <br>
   <a href="#" onClick="history.go(-1);return true;">Send Me Back A Page!</a>
 
    
    
   <%--body>
       <h1>Hello World!</h1>
       <a href="#" onClick="history.go(-1);return true;">Send Me Back A Page!</a>

   </body--%>
</html>
