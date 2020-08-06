package JavaFiles;
import java.sql.Date;

public class User {
        public  int am;
        public  String password;
        public  String name;
        public  String surname;
        public  String cv;
	public	boolean cvflag;
        public  Date bdate;
        public  int school;
        
        
public User()
{
	cvflag=false;
}
public User(int uam,String upassword,String uname,String usurname,String ucv,Date ubdate,int uschool)
{
	am=uam;
	password=upassword;
	name=uname;
	surname=usurname;
	cv=ucv;
	cvflag=false;
	bdate=ubdate;
	school=uschool;
}
	

   
}