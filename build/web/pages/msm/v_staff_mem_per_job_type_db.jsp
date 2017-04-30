
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<%-- 
    Document   : v_staff_mem_per_job_type_db
    Created on : Apr 26, 2017, 12:11:36 PM
    Author     : bakfark
--%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
    <HEAD>
    <TITLE>Using the switch Statement</TITLE>
  </HEAD>

  <BODY>
    <H1>Using the switch Statement</H1>
    <%--
        int day = 3;

        switch(day) {
            case 0:
                out.println("It\'s Sunday.");
                break;
            case 1:
                out.println("It\'s Monday.");
                break;
            case 2:
                out.println("It\'s Tuesday.");
                break;
            case 3:
                out.println("It\'s Wednesday.");
                break;
            case 4:
                out.println("It\'s Thursday.");
                break;
            case 5:
                out.println("It\'s Friday.");
                break;
            default:
                out.println("It must be Saturday.");
        }
  --%>   
    </BODY>
    
  <BODY>
      
      <%@ page import="java.util.*" %>
    <%!
public static final int ID_PHYSICIAN = 1 ;
public static final int ID_NURSE = 2 ;
public static final int ID_STAFF = 3 ;
public static final int ID_SURGEON = 4 ;
%>
...
<%@page import="java.util.Hashtable"%>
<%
Hashtable keyHash = new Hashtable() ;
keyHash.put( "physician", new Integer( ID_PHYSICIAN ) ) ;
keyHash.put( "nurse", new Integer( ID_NURSE ) ) ;
keyHash.put( "staff", new Integer( ID_STAFF ) ) ;
keyHash.put( "surgeon", new Integer( ID_SURGEON ) ) ;
String mOption = request.getParameter("colour");
Integer key = (Integer)keyHash.get(mOption);
%>

<%
if( key != null )
{
switch( key.intValue() )
{
   case ID_PHYSICIAN :
           out.println("It\'s Physician.");
           response.sendRedirect("v_staff_mem_per_job_type_db_1.jsp");
        break;
   case ID_NURSE :
           out.println("It\'s Nurse.");
           response.sendRedirect("v_staff_mem_per_job_type_db_2.jsp");
        break;
   case ID_STAFF :
           out.println("It\'s Staff.");
           response.sendRedirect("v_staff_mem_per_job_type_db_3.jsp");
        break;
   case ID_SURGEON :
           out.println("It\'s Surgeon.");
           response.sendRedirect("v_staff_mem_per_job_type_db_4.jsp");
        break;     
}
}
%>
  </BODY>
  <BODY>
   <%--
        String colour = request.getParameter("colour");
        out.println(colour);
        --%>
      
  </BODY>  
  <br><br>
<a href="#" onClick="history.go(-1);return true;">Send Me Back A Page!</a>

</html>
