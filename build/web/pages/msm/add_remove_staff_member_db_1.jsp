<%-- 
    Document   : add_remove_staff_member_db
    Created on : Apr 27, 2017, 7:25:54 PM
    Author     : bakfark
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World! Goodbuy</h1>
    </body>
    <BODY>
        <H1>Determining Which Button Was Clicked</H1>
        You clicked 
        <%= request.getParameter("buttonName") %>
    </BODY>
    
    
     <BODY>
    
      <%@ page import="java.util.*" %>
    <%!
public static final int ID_PHYSICIAN = 1 ;
public static final int ID_NURSE = 2 ;
public static final int ID_STAFF = 3 ;
public static final int ID_SURGEON = 4 ;
public static final int ID_BUTTON1 = 5 ;
public static final int ID_BUTTON2 = 6 ;
%>
...
<%@page import="java.util.Hashtable"%>
<%
Hashtable keyHash = new Hashtable() ;
keyHash.put( "physician", new Integer( ID_PHYSICIAN ) ) ;
keyHash.put( "nurse", new Integer( ID_NURSE ) ) ;
keyHash.put( "staff", new Integer( ID_STAFF ) ) ;
keyHash.put( "surgeon", new Integer( ID_SURGEON ) ) ;
keyHash.put( "button 1", new Integer( ID_BUTTON1 ) ) ;
keyHash.put( "button 2", new Integer( ID_BUTTON2 ) ) ;
String mOption = request.getParameter("colour");
out.println("mOption");
//String status = request.getParameter("buttonName");
Integer key = (Integer)keyHash.get(mOption);
//Integer key2 = (Integer)keyHash.get(status);
%>




<%


if( key != null )
{
switch( key.intValue() )
{
   case ID_PHYSICIAN :
           out.println("It\'s Physician.");
           response.sendRedirect("add_remove_staff_member_db_a_1_1.jsp");
        break;
   case ID_NURSE :
           out.println("It\'s Nurse.");
           response.sendRedirect("add_remove_staff_member_db_a_2_1.jsp");
        break;
   case ID_STAFF :
           out.println("It\'s Staff.");
           response.sendRedirect("add_remove_staff_member_db_a_3_1.jsp");
        break;
   case ID_SURGEON :
           out.println("It\'s Surgeon.");
           response.sendRedirect("add_remove_staff_member_db_a_4_1.jsp");
        break;     
}
}

%>
  </BODY>
 
  <br>
  
   <a href="#" onClick="history.go(-1);return true;">Send Me Back A Page!</a>
 
    
    
    
    
</html>
