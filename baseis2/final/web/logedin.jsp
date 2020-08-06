<%@page import="java.sql.Date"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="JavaFiles.*"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
        Boolean found;
        int a_user= Integer.parseInt(request.getParameter("id"));      
        String a_pass=request.getParameter("psw");
         String  URL;
                Class.forName("com.mysql.jdbc.Driver");
        String DB = "jdbc:mysql://localhost:3306/final?user=root";
        Connection myConnection = DriverManager.getConnection(DB);
        Statement SMT = myConnection.createStatement();
        String sql="SELECT * FROM student WHERE s_no='"+a_user+"'AND password='"+a_pass+"' ";
        ResultSet rs=SMT.executeQuery(sql);
        found= rs.first();
        if (found){ 
        URL = "profile.jsp?p1="+a_user+"&flag=true"; 
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
        <h1 align="center"> INCORRECT TRY AGAIN </h1>
        <h1 align="center"> <a href="index.html">Try Again</a> </h1>
        
        <%
         }
        SMT.close();
        myConnection.close();
        %>
    </body>
</html>