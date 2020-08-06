<%@page import="java.sql.Date"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="JavaFiles.*"%>
<%@page import="java.util.ArrayList"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <style>

html { 
  background: url(./picture/reg.jpg) no-repeat center center fixed; 
  -webkit-background-size: cover;
  -moz-background-size: cover;
  -o-background-size: cover;
  background-size: cover;
}

		n1.hidden {
		visibility: hidden}
		</style>

          
        <script>
        function addRow(tableID) {

			var table = document.getElementById(tableID);

			var rowCount = table.rows.length;
			var row = table.insertRow(rowCount);

			var colCount = table.rows[0].cells.length;

			for(var i=0; i<colCount; i++) {

				var newcell	= row.insertCell(i);

				newcell.innerHTML = table.rows[0].cells[i].innerHTML;
				//alert(newcell.childNodes);
				switch(newcell.childNodes[0].type) {
					case "text":
							newcell.childNodes[0].value = "";
							break;
					case "checkbox":
							newcell.childNodes[0].checked = false;
							break;
					case "select-one":
							newcell.childNodes[0].selectedIndex = 0;
							break;
				}
			}
		}

		function deleteRow(tableID) {
			try {
			var table = document.getElementById(tableID);
			var rowCount = table.rows.length;

			for(var i=0; i<rowCount; i++) {
				var row = table.rows[i];
				var chkbox = row.cells[0].childNodes[0];
				if((null != chkbox) && (true == chkbox.checked)) {
					if(rowCount <= 1) {
						alert("Cannot delete all the rows.");
						break;
					}
					table.deleteRow(i);
					rowCount--;
					i--;
				}


			}
			}catch(e) {
				alert(e);
			}
		}
		
	</SCRIPT>
    </head>
    <body>
        <%
        int user= Integer.parseInt(request.getParameter("p1"));        
        User user1=new User();
        user1.am=user;
        // Load the driver
        Class.forName("com.mysql.jdbc.Driver");
        // Define the connection parameters
        String myDatabase =
        "jdbc:mysql://localhost:3306/final?user=root";
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
        
        
		
        //sundesh me Sxolh
        School t=new School();
        String sql= "select institution,facultry,department from school,student where school.sch_no=student.sch_no and s_no='"+user+"' ";
        rs=myStatement.executeQuery(sql);
        rs.first();
        t.institution=rs.getString("institution");
        t.facultry=rs.getString("facultry");
        t.department=rs.getString("department");
        t.school=user1.school;
	
        
        //syndesh me photos
	ArrayList<Photo> photos=new ArrayList<Photo>();
        sql= "SELECT * FROM photos WHERE s_no='"+user+"' ";
        rs=myStatement.executeQuery(sql);
        while(rs.next()){
            Photo tmp=new Photo();
            tmp.s_no=rs.getInt("s_no");
            tmp.p_no=rs.getInt("p_no");
            tmp.photo=rs.getString("photo");
            photos.add(tmp);
        }
        
        //syndesh me videos
	ArrayList<Video> videos=new ArrayList<Video>();
        sql= "SELECT * FROM videos WHERE s_no='"+user+"' ";
        rs=myStatement.executeQuery(sql);
        while(rs.next()){
            Video tmp=new Video();
            tmp.s_no=rs.getInt("s_no");
            tmp.v_no=rs.getInt("v_no");
            tmp.video=rs.getString("video");
            videos.add(tmp);
        }
        
        
        //suyndesh me Language
        ArrayList<Language> languages = new ArrayList<Language>();
        sql= "SELECT * FROM languages WHERE s_no='"+user+"' ";
        rs=myStatement.executeQuery(sql);
        while(rs.next()){
                Language tmp=new Language();
                tmp.s_no=rs.getInt("s_no");
                tmp.language=rs.getString("language");
                tmp.level=rs.getString("level");
		languages.add(tmp);
	}

        
        //syndesh me Interests
        ArrayList<Interest> interests = new ArrayList<Interest>();
        sql= "SELECT interest.i_no,interest FROM interest,interests WHERE interest.i_no=interests.i_no and s_no='"+user+"'" ;
        rs=myStatement.executeQuery(sql);
        while(rs.next()){
		Interest tmp1=new Interest();
                tmp1.s_no=user1.am;
                tmp1.i_no=rs.getInt("i_no");
                tmp1.interest=rs.getString("interest");
		interests.add(tmp1);
	}
		
        
	//syndesh me Hobbies
	ArrayList<Hobby> hobbies = new ArrayList<Hobby>();
        sql= "SELECT hobby.h_no,hobby FROM hobby,hobbies WHERE hobby.h_no=hobbies.h_no and s_no='"+user+"'" ;
        rs=myStatement.executeQuery(sql);
        while(rs.next()){
		Hobby tmp2=new Hobby();
                tmp2.s_no=user1.am;
                tmp2.h_no=rs.getInt("h_no");
                tmp2.hobby=rs.getString("hobby");
		hobbies.add(tmp2);
	}
		
       
	//suyndesh me Quote
	ArrayList<Quote> quotes = new ArrayList<Quote>();        
        sql= "SELECT * FROM quotes WHERE s_no='"+user+"' ";
        rs=myStatement.executeQuery(sql);
        while(rs.next()){
            Quote temp=new Quote();
            temp.q_no=rs.getInt("s_no");
            temp.s_no=rs.getInt("q_no");
            temp.quote=rs.getString("quote");
            temp.date=rs.getDate("q_date"); 
            quotes.add(temp);
	}
				
        myStatement.close();
        myConnection.close();  
        %>
        
        <h2>INSERT YOUR PASSWORD IN ORDER TO VALIDATE YOUR CHANGES</h2>
        <%String check= new String();%>
	<form name="changed" action="changed.jsp" method="get" >  	
        <b>Department--Faculty--Institution:</b><br>
        <select name="school">
			<%if (user1.school==100100 ) check="selected"; else check="";%>
                        <option value="100100" <%out.print(check);%>>Αριστοτέλειο Πανεπιστήμιο Θεσσαλονίκης--Πολυτεχνική σχολή--Τμημα Μηχανολόγων Μηχανικών</option>
			<%if (user1.school==100101 ) check="selected"; else check="";%>
			<option value="100101" <%out.print(check);%>>Αριστοτέλειο Πανεπιστήμιο Θεσσαλονίκης--Πολυτεχνική σχολή--Τμημα Ηλεκτρολόγων Μηχανικών και Μηχανικών Υπολογιστών</option>
			<%if (user1.school==101100 ) check="selected"; else check="";%>
			<option value="101100" <%out.print(check);%>>Αριστοτέλειο Πανεπιστήμιο Θεσσαλονίκης--Σχολή Θετικών Επιστημών--Τμημα Πληροφορικής</option>
			<%if (user1.school==200100 ) check="selected"; else check="";%>
			<option value="200100" <%out.print(check);%>>Δημοκρίτειο Πανεπιστήμιο Θράκης--Πολυτεχνική σχολή--Τμημα Ηλεκτρολόγων Μηχανικών και Μηχανικών Υπολογιστών</option>
			<%if (user1.school==300100 ) check="selected"; else check="";%>
			<option value="300100" <%out.print(check);%>>Εθνικό Μετσοβιο Πολυτεχνείο--Πολυτεχνική σχολή--Τμημα Ηλεκτρολόγων Μηχανικών και Μηχανικών Υπολογιστών</option>
			<%if (user1.school==400100 ) check="selected"; else check="";%>
			<option value="400100" <%out.print(check);%>>Εθνικό Καποδιστριακό Πανεπιστήμιο Αθηνών--Σχολή Θετικών Επιστημών--Τμημα Πληροφορικής και Τηλεπικοινωνιών</option>
			<%if (user1.school==500100 ) check="selected"; else check="";%>
			<option value="500100" <%out.print(check);%>>Οικονομικό Πανεπιστήμιο Αθηνών--Σχολή Επιστημών και Τεχνολογίας της Πληροφορίας--Τμημα Πληροφορικής</option>
			<%if (user1.school==600100 ) check="selected"; else check="";%>
			<option value="600100" <%out.print(check);%>>Πανεπιστήμιο Πειραιώς--Σχολή Πληροφορικής και Επικοινωνιών--Τμημα Πληροφορικής</option>
			<%if (user1.school==700100 ) check="selected"; else check="";%>
			<option value="700100" <%out.print(check);%>>Τει Αθήνας--Σχολή Τεχνολογικών Εφαρμογών--Τμημα Μηχανικών Υπολογιστών</option>
			<%if (user1.school==800100 ) check="selected"; else check="";%>
			<option value="800100" <%out.print(check);%>>Τει Κρήτης--Σχολή Τεχνολογικών Εφαρμογών--Τμημα Μηχανικών Υπολογιστών</option>
		</select><br><br>
                
   
<div class="w3-quarter">
        
        <b>Password:</b><br>
        <input type="password" name="password" required><br>
        <b>change Password:</b><br>
        <input type="password" name="newpassword" >
        <n1 class="hidden"><input type="text" name="am" value="<%out.print(user);%>" readonly="readonly"/></n1> <br> 
        <b>change Name:</b><br>
        <input type="text" name="name" value="<%out.print(user1.name);%>" ><br>
        <b>change Surname:</b><br>
        <input type="text" name="surname" value="<%out.print(user1.surname);%>"><br>
	
           
        <b>Insert your birthdate:</b><br>
          <input type="date" name="bday" value="<%out.print(user1.bdate);%>"><br><br>
          
    <b>Insert the languages you know with the level o difficulty:</b><br>
    <INPUT type="button" value="Add Row" onclick="addRow('dataTable3')" />
    <INPUT type="button" value="Delete Row" onclick="deleteRow('dataTable3')" />

        <TABLE id="dataTable3"  border="1">

            <%  Language temp3=new Language();
                    for(int i=0;i<languages.size();i++)
                    {	temp3=languages.get(i);
            %>	
            <TR>    <TD><INPUT type="checkbox" name="chk" /></TD>
                    <TD><INPUT type="text" name="lang"  size="25" value="<%out.print(temp3.language);%> "/></TD>
                    <TD>    <%check= new String();%>
                            <SELECT name="level">
                                <%if (temp3.level.equals("elementary")) check="selected"; else check="";%>
                                    <OPTION value="elementary" <%out.print(check);%>>elemetary</OPTION>
                                    <%if (temp3.level.equals("intermediate")) check="selected"; else check="";%>
                                    <OPTION value="intermediate" <%out.print(check);%>>intermediate</OPTION>
                                    <%if (temp3.level.equals("advanved")) check="selected"; else check="";%>
                                    <OPTION value="advanved" <%out.print(check);%>>advanced</OPTION>
                                    <%if (temp3.level.equals("proficient")) check="selected"; else check="";%>
                                    <OPTION value="proficient" <%out.print(check);%>>proficient</OPTION>

                            </SELECT>
                    </TD> 
                    <TD><input type="reset" value="undo"></TD>
            </TR>     
            <%      } %>

        </TABLE>
                <br>
                
<b>Give a video's URL from youtube :</b><br>
    <INPUT type="button" value="Add Row" onclick="addRow('dataTable2')" />
    <INPUT type="button" value="Delete Row" onclick="deleteRow('dataTable2')" />

        <TABLE id="dataTable2"  border="1">
            <%  Video temp2=new Video();
                    for(int i=0;i<videos.size();i++)
                    {	temp2=videos.get(i);
            %>	
            <TR>    <TD><INPUT type="checkbox" name="chk" /></TD>
                    <TD><input type="text" name="video" size="60" value="<%out.print(temp2.video);%>"></TD> 
                    <TD><input type="reset" value="undo"></TD>
            </TR>     
            <%      } %>
         </TABLE>
           
<b>Give a photo's URL :</b><br>
    <INPUT type="button" value="Add Row" onclick="addRow('dataTable1')" />
    <INPUT type="button" value="Delete Row" onclick="deleteRow('dataTable1')" />

        <TABLE id="dataTable1"  border="1">

            <%  Photo temp1=new Photo();
                    for(int i=0;i<photos.size();i++)
                    {	temp1=photos.get(i);
            %>	
            <TR>    <TD><INPUT type="checkbox" name="chk" /></TD>
                    <TD><input type="text" name="photo" size="60" value="<%out.print(temp1.photo);%>"></TD> 
                    <TD><input type="reset" value="undo"></TD>
            </TR>     
            <%      } %>
        </TABLE>

</div>     
<div class="w3-third">
 <div class="w3-container">
  <label for="file">  <b>Choose your interests:</b></label><br>
  <div class="w3-half w3-container">
  <% check= new String();
  if (Interest.exists(interests,1) ) check="checked"; else check="";%>
  <input type="checkbox" name="interest1" value="1" <%out.print(check);%>>Database<br>
  <%if (Interest.exists(interests,2) ) check="checked"; else check="";%>
  <input type="checkbox" name="interest1" value="2" <%out.print(check);%>>Web programming<br>
  <%if (Interest.exists(interests,3) ) check="checked"; else check="";%>
  <input type="checkbox" name="interest1" value="3" <%out.print(check);%>>Human Computer Interaction<br>
  <%if (Interest.exists(interests,4) ) check="checked"; else check="";%>
  <input type="checkbox" name="interest1" value="4" <%out.print(check);%>>Data Mining<br>
  <%if (Interest.exists(interests,5) ) check="checked"; else check="";%>
  <input type="checkbox" name="interest1" value="5" <%out.print(check);%>>Software Engineering<br>
  </div><div class="w3-half w3-container">
  <%if (Interest.exists(interests,6) ) check="checked"; else check="";%>
  <input type="checkbox" name="interest1" value="6" <%out.print(check);%>>Information Retrieval<br>
  <%if (Interest.exists(interests,7) ) check="checked"; else check="";%>
  <input type="checkbox" name="interest1" value="7" <%out.print(check);%>>Software Quality<br>
  <%if (Interest.exists(interests,8) ) check="checked"; else check="";%>
  <input type="checkbox" name="interest1" value="8" <%out.print(check);%>>e-commerce<br>
  <%if (Interest.exists(interests,9) ) check="checked"; else check="";%>
  <input type="checkbox" name="interest1" value="9" <%out.print(check);%>>Management Information Systems<br>
  <%if (Interest.exists(interests,10) ) check="checked"; else check="";%>
  <input type="checkbox" name="interest1" value="10" <%out.print(check);%>>Information Systems<br>
  </div></div>
    <br><br>
 <div class="w3-container">
   <label for="file"> <b> Choose your hobbies:</b></label><br>
   <div class="w3-half w3-container">  
  <% check= new String();
  if (Hobby.exists(hobbies,1) ) check="checked"; else check="";%>
  <input type="checkbox" name="interest2" value="1" <%out.print(check);%>>Football<br>
  <%if (Hobby.exists(hobbies,2) ) check="checked"; else check="";%>
  <input type="checkbox" name="interest2" value="2" <%out.print(check);%>>Swimming<br>
  <%if (Hobby.exists(hobbies,3) ) check="checked"; else check="";%>
  <input type="checkbox" name="interest2" value="3" <%out.print(check);%>>Tennis<br>
  <%if (Hobby.exists(hobbies,4) ) check="checked"; else check="";%>
  <input type="checkbox" name="interest2" value="4" <%out.print(check);%>>Basketball<br>
  <%if (Hobby.exists(hobbies,5) ) check="checked"; else check="";%>
  <input type="checkbox" name="interest2" value="5" <%out.print(check);%>>Fishing<br>
  <%if (Hobby.exists(hobbies,6) ) check="checked"; else check="";%>
  <input type="checkbox" name="interest2" value="6" <%out.print(check);%>>Photography<br>
  </div><div class="w3-half w3-container">
  <%if (Hobby.exists(hobbies,7) ) check="checked"; else check="";%>
  <input type="checkbox" name="interest2" value="7" <%out.print(check);%>>Piano<br>
  <%if (Hobby.exists(hobbies,8) ) check="checked"; else check="";%>
  <input type="checkbox" name="interest2" value="8" <%out.print(check);%>>Violin<br>
  <%if (Hobby.exists(hobbies,9) ) check="checked"; else check="";%>
  <input type="checkbox" name="interest2" value="9" <%out.print(check);%>>Guitar<br>
  <%if (Hobby.exists(hobbies,10) ) check="checked"; else check="";%>
  <input type="checkbox" name="interest2" value="10" <%out.print(check);%>>Drams<br>
  <%if (Hobby.exists(hobbies,11) ) check="checked"; else check="";%>
  <input type="checkbox" name="interest2" value="11" <%out.print(check);%>>Reading Books<br>
  <%if (Hobby.exists(hobbies,12) ) check="checked"; else check="";%>
  <input type="checkbox" name="interest2" value="12" <%out.print(check);%>>Drawing<br>
<br><br>
  </div>
 </div></div>
            
<div class="w3-rest">             
<b>My cv:</b><br>
          <textarea name="cv"  rows="5" cols="50" ><%out.print(user1.cv);%></textarea><br><br>


<b>Add a quote:</b><br>
    <INPUT type="button" value="Add Row" onclick="addRow('dataTable4')" />
    <INPUT type="button" value="Delete Row" onclick="deleteRow('dataTable4')" />
          <TABLE id="dataTable4"  border="1">
          <%  Quote temp4=new Quote();
          for(int i=0;i<quotes.size();i++)
          {	temp4=quotes.get(i);
                  %>
                  <TR>
                          <TD><INPUT type="checkbox" name="check2"/></TD>
                          <TD><textarea name="quote" rows="5" cols="50" ><%out.print(temp4.quote);%> </textarea><br><br></TD>
                          <TD><input type="reset" value="undo"></TD>
                  </TR>
          <%      } %>
          </TABLE>
          <br>

<input type="submit" style="color:red" value="SEND"> </form> 
</div>

</body>
</html>