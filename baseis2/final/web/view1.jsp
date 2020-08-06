<%-- 
    Document   : view1
    Created on : 9 Μαϊ 2017, 8:49:16 μμ
    Author     : Angela
--%>
<%@page import="java.sql.Date"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*" %>
<%@page import="JavaFiles.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% 
        int am=Integer.parseInt(request.getParameter("am"));
        Boolean found;
        String  URL;
        Class.forName("com.mysql.jdbc.Driver");
        String DB = "jdbc:mysql://localhost:3306/final?user=root";
        Connection myConnection = DriverManager.getConnection(DB);
        Statement SMT = myConnection.createStatement();
        String sql="SELECT * FROM student WHERE s_no='"+am+"' ";
        ResultSet rs=SMT.executeQuery(sql);
        found= rs.first();
        if (found){ 
        URL = "profile.jsp?p1="+am+"&flag=false"; 
        response.sendRedirect(URL);
        }
        else {      
  %>
  
  <style>
body { 
    background-image: url(./picture/kogiot.gif);
    background-repeat: no-repeat;
    background-attachment: fixed;
    background-position: center; 
}
</style>
  <h1 align="center"> <font color="red"><b>ΔΕΝ ΒΡΕΘΗΚΑΝ ΑΠΟΤΕΛΣΕΜΑΤΑ</b></font></h1> 
          <h1 align="center"> <a href="view.jsp?view=1">Try Again</a> </h1>
    <%
         }
        SMT.close();
        myConnection.close(); 
    %>
    </body>
</html>