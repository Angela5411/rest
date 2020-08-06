<%-- 
    Document   : view
    Created on : 9 Μαϊ 2017, 7:40:52 μμ
    Author     : Angela
--%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*" %>
<%@page import="JavaFiles.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Choose</title>
                <style>
html { 
  background: url(./picture/find.jpg) no-repeat center center fixed; 
  -webkit-background-size: cover;
  -moz-background-size: cover;
  -o-background-size: cover;
  background-size: cover;
}
<%-- το χρωμα των μεταβλητων--%> 
.whiteText {
   color: white;
}

<%-- για το κουτι για να μπει στην μεση χρωμα και διαστασεις --%> 
div {
    width: 100px;
    padding: 50px;
    border: 5px solid red;
    margin: auto;
}
n1.hidden {
    visibility: hidden}
</style>
        
    </head>
    <body>
       

<%
           int choice= Integer.parseInt(request.getParameter("view"));
           Class.forName("com.mysql.jdbc.Driver"); 
           // Define the connection parameters 
           String myDatabase = 
           "jdbc:mysql://localhost:3306/final?user=root"; 
           // Connect to the database 
           Connection myConnection = DriverManager.getConnection(myDatabase); 
           // Create object to execute statements  
           Statement SMT = myConnection.createStatement();  
           // Select everything from the database table  
           String sql = "SELECT * FROM student"; 
           switch (choice)
           {
               case 1:
               {
                 %> 
<h1  align="center"> <font color="#ffff00"><b>Tο βιογραφικό (cv) ενός συγκεκριμένου φοιτητή</b></font></h1>   
                <%
                %>
                    <form action="view1.jsp" method="get">
                        <h3> <font color="#ffff1a"><b>Δωσε Αριθμο Μητρωου</b></font></h3> 
                         <input type="text" name="am" required><br>
                        <input type="submit" value="search"/>
                    </form>
                    <%            
                    break;
               }
               case 2:
               {

%>
<h1 align="center"> <font color="#ffff00"><b>Oλα τα βιογραφικά αλφαβητικά</b></font></h1> 
<%
                   User temp1=new User();
                   sql="SELECT * FROM student order by surname ";
                   ResultSet rs=SMT.executeQuery(sql);
                   while (rs.next())
                   {
                    temp1.am=rs.getInt("s_no");
                    temp1.password=rs.getString("password");
                    temp1.surname=rs.getString("surname");
                    temp1.name=rs.getString("name");
                    temp1.cv=rs.getString("cv");
                    temp1.bdate=rs.getDate("birthdate");
                    temp1.school=rs.getInt("sch_no");
                    

                %>
<div><h3 align="center"><span class="whiteText"><%="MAΘΗΤΗΣ: "+temp1.surname+" "+temp1.name%></span></h3><br>
     <h3 align="center"><span class="whiteText"><%=" ΑΜ: "+temp1.am %></span></h3>
     <form action="profile.jsp" method="post">
        <n1 class="hidden"><input type="text" name="p1" value="<%out.print(temp1.am);%>" readonly="readonly"/></n1>
        <n1 class="hidden"><input type="text" name="flag" value="false" readonly="readonly"/></n1>
     <input type="submit" value="View Profile " align="center" ></form>
<br> <br>  </div>
<br>
                <% 
                    }



                   break;
               }
               case 3:
               {

        %>
       <h1  align="center"> <font color="#ffff00"><b>Tα βιογραφικά ανά επιστημονικό ενδιαφέρον (interest)</b></font></h1>                   
       <%
                   User temp1=new User();
                   Statement SMT2 = myConnection.createStatement();

                   sql="SELECT i_no FROM interest";
                   ResultSet rs=SMT.executeQuery(sql);
                   int count=0;
                   while (rs.next())
                   {    count=rs.getInt("i_no");
                        String sql2="SELECT student.s_no,surname,name FROM student,interests where interests.s_no=student.s_no AND i_no='"+count+"'";
                        ResultSet rs2=SMT2.executeQuery(sql2);
                        %>
                          <h1 align="center"><span class="whiteText"><%="<br>"+Interest.getInterest(count)+"<br>"%></span></h1>   
                        <%
                        while (rs2.next())
                        {
                         temp1.am=rs2.getInt("student.s_no");
                         temp1.surname=rs2.getString("surname");
                         temp1.name=rs2.getString("name");
                           %>                       
                        <div> <h3 align="center"><span class="whiteText"><%="MAΘΗΤΗΣ: "+temp1.surname+" "+temp1.name%></span></h3>
                        <br>
                        <h3 align="center"><span class="whiteText"><%=" ΑΜ: "+temp1.am %></span></h3>
                         <form action="profile.jsp" method="post">
                                <n1 class="hidden"><input type="text" name="p1" value="<%out.print(temp1.am);%>" readonly="readonly"/></n1>
                                <n1 class="hidden"><input type="text" name="flag" value="false" readonly="readonly"/></n1>
                        <input type="submit" value="View Profile " align="center" ></form><br> <br> 
                        </div><br>
                     <% 
                        } 
                    
                   }
                     SMT2.close();
                     break; 
                }
               case 4:
               {
        %>
       <h1  align="center"> <font color="#ffff00"><b>Bιογραφικά ανά ίδρυμα (institution)</b></font></h1>                   
       <%
          
                   User temp1=new User();
                   Statement SMT2 = myConnection.createStatement();

                   sql="SELECT DISTINCT institution FROM school ";
                   ResultSet rs=SMT.executeQuery(sql);
                   String inst;
                   while (rs.next())
                   {    inst=rs.getString("institution");
                        String sql2="SELECT student.s_no,surname,name FROM student,school where school.sch_no=student.sch_no AND institution='"+inst+"'";
                        ResultSet rs2=SMT2.executeQuery(sql2);
                         %>
                          <h1 align="center"><span class="whiteText"><%="<br>"+School.fromEtoG(inst)+"<br>"%></span></h1>   
                        <%
                        while (rs2.next())
                        {
                         temp1.am=rs2.getInt("student.s_no");
                         temp1.surname=rs2.getString("surname");
                         temp1.name=rs2.getString("name");
                     %>
                     <div> <h3 align="center"><span class="whiteText"><%="MAΘΗΤΗΣ: "+temp1.surname+" "+temp1.name%></span></h3>
                        <br>
                        <h3 align="center"><span class="whiteText"><%=" ΑΜ: "+temp1.am %></span></h3>
                         <form action="profile.jsp" method="post">
                            <n1 class="hidden"><input type="text" name="p1" value="<%out.print(temp1.am);%>" readonly="readonly"/></n1>
                            <n1 class="hidden"><input type="text" name="flag" value="false" readonly="readonly"/></n1>
                            <input type="submit" value="View Profile " align="center" ></form> <br> <br>  
                     </div><br>
                    
                     <% 
                        } 
                   }
                     SMT2.close();
                   break;
               }
               case 5:
               {
  %>
       <h1  align="center"> <font color="#ffff00"><b>Πόσα βιογραφικά έχoυν αναρτηθεί για κάθε ίδρυμα (institution)</b></font></h1>                   
       <%
                   Statement SMT2 = myConnection.createStatement();
                   sql="SELECT DISTINCT institution FROM school ";
                   ResultSet rs=SMT.executeQuery(sql);
                   String inst;
                   while (rs.next())
                   {    inst=rs.getString("institution");
                      
			int count=0;
                        String sql2="SELECT COUNT(*)AS total FROM student,school where school.sch_no=student.sch_no AND institution='"+inst+"'";
                        ResultSet rs2=SMT2.executeQuery(sql2);
                        rs2.first();
                            count=rs2.getInt("total");
                        %>         
                        <h1 align="center"><span class="whiteText"><%="<br>"+School.fromEtoG(inst)+":  " +count %></span></h1>
                        <%
                   }
                   SMT2.close();
                   break;
               }
               case 6:
               {
  %>
       <h1  align="center"> <font color="#ffff00"><b>Πόσα βιογραφικά έχουν αναρτηθεί ανά επιστημονικό ενδιαφέρον (interest)</b></font></h1>                   
       <%
                  
                   Statement SMT2 = myConnection.createStatement();

                   sql="SELECT i_no FROM interest";
                   ResultSet rs=SMT.executeQuery(sql);
                   int i_no;
                   while (rs.next())
                   {    i_no=rs.getInt("i_no");
			int count=0;
                        String sql2="SELECT COUNT(*)AS total FROM student,interests where interests.s_no=student.s_no AND i_no='"+i_no+"'";
                        ResultSet rs2=SMT2.executeQuery(sql2);
                        rs2.first();
                            count=rs2.getInt("total");       
                             %>         
                        <h1 align="center"><span class="whiteText"><%="<br>"+Interest.getInterest(i_no)+": "+count %></span></h1>
                        <%
          
                   }
                     SMT2.close();
                   break;
               }
           }
           



 
        SMT.close(); 
        myConnection.close(); 

        %>
    </body>
</html>
