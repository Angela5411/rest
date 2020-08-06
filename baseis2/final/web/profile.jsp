<%@page import="java.sql.Date"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="JavaFiles.*"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>My profile</title>
        
        <style>
            html { 
  background: url(./picture/profile.jpg) no-repeat center center fixed; 
  -webkit-background-size: cover;
  -moz-background-size: cover;
  -o-background-size: cover;
  background-size: cover;
}
.nav3 {
    background-color: #E9E8C7;
    height: auto;
    width: auto;
    float: left;
    padding-left: 20px;
    font-family: Arial, Helvetica, sans-serif;
    font-size: 12px;
    color: #333333;
    padding-top: 20px;
    padding-right: 20px;
}

.icons{
    display:inline-block;
    width: auto; 
    height: auto; 
   }

.icons a:hover {
     background: #C93;
 }
</style>
    </head>
</body>   
        <INPUT TYPE="BUTTON" VALUE="GO BACK" style="font-size:10px"
        ONCLICK="window.location.href='index.html'">
        
        <%
        int user= Integer.parseInt(request.getParameter("p1"));
        boolean flag=Boolean.parseBoolean(request.getParameter("flag"));
        if(flag){
        %> <INPUT TYPE="BUTTON" VALUE="MAKE CHANGES" style="font-size:10px"
        ONCLICK="window.location.href='change.jsp?p1=<%out.print(user);%>'">
        <%
        }
        User user1=new User();
        user1.am=user;
        // Load the driver
        Class.forName("com.mysql.jdbc.Driver");
        // Define the connection parameters
        String myDatabase =
        "jdbc:mysql://localhost:3306/final?user=root&password=rootP";
        // Connect to the database
        Connection myConnection = DriverManager.getConnection(myDatabase);
        // Create object to execute statements
        Statement myStatement = myConnection.createStatement();
        // Select everything from the database table
        String sqlString = "SELECT * FROM student WHERE s_no='"+user+"' ";
        ResultSet rs=myStatement.executeQuery(sqlString);
        // Store the results in vectors in order to pass them to the JSP

        rs.first();
        rs.getInt("s_no");
        user1.password=rs.getString("password");
        user1.surname=rs.getString("surname");
        user1.name=rs.getString("name");
        user1.cv=rs.getString("cv");
        user1.bdate=rs.getDate("birthdate");
        user1.school=rs.getInt("sch_no");
        %>
        <h1 align="center">My Profile</h1><br>
        <h3 ><%="Student "+user1.surname+" "+user1.name+ " with AM " + user1.am%></h3>
        <%
        
 
        out.println("<br> Born at: "+ user1.bdate + "<br>" );
        %><h3 >information/cv:</h3><%
        out.println("<br>"+ user1.cv +"<br>" );
        
        
        
        
        
        
        
        //suyndesh me Sxolh
        School t=new School();
        out.println("<br>"+"The school I attent:<br>");
        String sql= "select institution,facultry,department from school,student where school.sch_no=student.sch_no and s_no='"+user+"' ";
        rs=myStatement.executeQuery(sql);
        rs.first();
        t.institution=rs.getString("institution");
        t.facultry=rs.getString("facultry");
        t.department=rs.getString("department");
        t.school=user1.school;
        %>
            <h3><%out.print(t.institution+" "+t.facultry+" "+t.department);%></h3> 
        <%
        
       

        //suyndesh me Language
        Language tmp=new Language();
        %><h3 >The languages I know:<br></h3><%
        sql= "SELECT * FROM languages WHERE s_no='"+user+"' ";
        rs=myStatement.executeQuery(sql);
        while(rs.next()){
                tmp.s_no=rs.getInt("s_no");
                tmp.language=rs.getString("language");
                tmp.level=rs.getString("level");
        %>
            <p class="double"><%out.print(tmp.language+" at level: "+tmp.level);%></p> 
        <%
        }    
            

        //syndesh me Interests
        
        %>
        <h3 ><br>My interests:<br></h3><%
        Interest tmp1=new Interest();
        sql= "SELECT interest.i_no,interest FROM interest,interests WHERE interest.i_no=interests.i_no and s_no='"+user+"'" ;
        rs=myStatement.executeQuery(sql);
        while(rs.next()){
                tmp1.s_no=user1.am;
                tmp1.i_no=rs.getInt("i_no");
                tmp1.interest=rs.getString("interest");
        %>
            <p class="double"><%out.print(tmp1.interest+"<br>");%></p> 
        <%
        } 





        //syndesh me Hobbies
        Hobby tmp2=new Hobby();
        %><h3 ><br>My hobbies<br></h3><%
        sql= "SELECT hobby.h_no,hobby FROM hobby,hobbies WHERE hobby.h_no=hobbies.h_no and s_no='"+user+"'" ;
        rs=myStatement.executeQuery(sql);
        while(rs.next()){
                tmp2.s_no=user1.am;
                tmp2.h_no=rs.getInt("h_no");
                tmp2.hobby=rs.getString("hobby");
        %>
            <p class="double"><%out.print(tmp2.hobby+"<br>");%></p> 
        <%
        } 




        
        %><h3 ><br>My quotes<br></h3><%
        //suyndesh me Quote
        Quote temp=new Quote();
        sql= "SELECT * FROM quotes WHERE s_no='"+user+"' ";
        rs=myStatement.executeQuery(sql);
        while(rs.next()){
            temp.q_no=rs.getInt("s_no");
            temp.s_no=rs.getInt("q_no");
            temp.quote=rs.getString("quote");
            temp.date=rs.getDate("q_date"); 
            out.println("<br>"+temp.date+"<br>"); %>
            <p class="double"><%out.print(temp.quote);%></p> 
        <% }

         
        
        

%>
        
<!-- Photo grid -->
<div class="half">
  <div class="nav3" style="height:auto;" style="width:auto;">
<%
 //syndesh me photos
        Photo temp4=new Photo();
        out.println("My photos: <br>");
        sql= "SELECT * FROM photos WHERE s_no='"+user+"' ";
        rs=myStatement.executeQuery(sql);
        while(rs.next()){
            temp4.s_no=rs.getInt("s_no");
            temp4.p_no=rs.getInt("p_no");
            temp4.photo=rs.getString("photo");
        %>
        <a href="<%out.print(temp4.photo);%>" class="icons">
            <img src="<%out.print(temp4.photo);%>"style="width:100%" /></a>
        <%
         }  

%>
  </div></div><br>
  <div class="half">
  <div class="nav3" style="height:auto;" style="width:auto;">
<%

         //syndesh me videos
        Video temp5=new Video();
        out.println("<br> My videos: <br>");
        sql= "SELECT * FROM videos WHERE s_no='"+user+"' ";
        rs=myStatement.executeQuery(sql);
        while(rs.next()){
            temp5.s_no=rs.getInt("s_no");
            temp5.v_no=rs.getInt("v_no");
            temp5.video=rs.getString("video");
            %>
            <iframe width="560" height="315" src="<%out.print(temp5.video);%>" frameborder="0" allowfullscreen></iframe>
            <%
        }
%>
  </div></div><br>            
<%
        myStatement.close();
        myConnection.close(); 
        %>
           
        </body>  
        </html>