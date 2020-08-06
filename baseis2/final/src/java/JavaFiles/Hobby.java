package JavaFiles;
import java.util.ArrayList;
import java.sql.Date;

public class Hobby {
   public int s_no;
   public int h_no;
   public String hobby;
   
   public Hobby()
   {
       s_no=1;
       hobby="Football";
   }
   public static boolean exists(ArrayList <Hobby> hobbies,int x)
   {
	   Hobby hobby=new Hobby();
	   for(int i=0; i<hobbies.size();i++)
	   {
		   hobby=hobbies.get(i);
		   if(hobby.h_no==x )
			   return true;
	   }
	   return false;
   }
   
   public void setHobby()
   {
       switch (h_no)
       {
           case 1:
               hobby="Football";
               break;
           case 2:
               hobby="Swimming";
               break;
           case 3:
               hobby="Tennis";
               break;
           case 4:
               hobby="Basketball";
               break;
           case 5:
               hobby="Fishing";
               break;
           case 6:
               hobby="Photography";
               break;
           case 7:
               hobby="Piano";
               break;
           case 8:
               hobby="Violin";
               break;
           case 9:
               hobby="Guitar";
               break;
           case 10:
               hobby="Drams";
               break;
           case 11:
               hobby="Reading Books";
               break;
           case 12:
               hobby="Drawing";
               break;
           
       }
   }
}
