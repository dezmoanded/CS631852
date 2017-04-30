<%-- 
    Document   : add_remove_staff_member
    Created on : Apr 19, 2017, 12:49:45 PM
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
        <h1>Add/Remove a Staff Members</h1>
    </body>
    
     <body>
        <form method="post" action="add_remove_staff_member_db.jsp" name="Form1">
            <select name="colour" id="dropdown">
                <option value="dropdown">Pls select one</option>
                <option value="surgeon">Surgeon</option>
                <option value="nurse">Nurse</option>
                <option value="staff">Staff</option>
                <option value="physician">Physician</option>
            </select>
            <%--input type="submit" value="click"--%>
           <%--INPUT TYPE="HIDDEN" NAME="buttonName"--%>
           <INPUT TYPE="BUTTON" NAME="buttonName1" VALUE="Add" ONCLICK="myFunction1()">
            <INPUT TYPE="BUTTON" NAME="buttonName2" VALUE="Remove" ONCLICK="myFunction2()">
            <%--button onclick="myFunction1()">Add</button--%>
            <%--button onclick="myFunction2()">Remove</button--%>
          
        </form>
        <%
        String colour = request.getParameter("colour");
        //out.println(colour);
        %>
         <%
   session.setAttribute( "colour", colour );
 
%>
        <%--script>
        document.getElementById("dropdown").value = '<% out.print(colour);%>'
        <script--%>
        
    </body>
   <script> 
    function myFunction1() {
   //var number = 0;
  // document.productForm.buttonName1.value = "button 1";
    //               productForm.submit();
//window.location="add_remove_staff_member.jsp?param="+number; 
//String var = request.getParameter("param");
//String buttonName = request.getParameter("buttonName");
//ession.setAttribute("butttonName", document.productForm.buttonName1);
//out.println(document.productForm.buttonName1);

    document.Form1.action = "add_remove_staff_member_db_1.jsp"
   // document.Form1.target = "_blank";    // Open in a new window
    document.Form1.submit();             // Submit the page
    return true;
    }
    
    
    function myFunction2() {
   //    var number = 1;
  //      document.productForm.buttonName2.value = "button 2";
    //               productForm.submit();
//window.location="add_remove_staff_member.jsp?param="+number; 
//String var = request.getParameter("param");
//String buttonName = request.getParameter("buttonName");
//session.setAttribute("buttonName", document.productForm.buttonName2);
document.Form1.action = "add_remove_staff_member_db_2.jsp"
  //  document.Form1.target = "_blank";    // Open in a new window
    document.Form1.submit();             // Submit the page
    return true;
    }
</script>
    
    <br><br>
      <a href="#" onClick="history.go(-1);return true;">Send Me Back A Page!</a>

</html>
