package JavaFiles;
import java.util.ArrayList;
import java.sql.Date;

public class Interest {
    public int s_no;
    public int i_no;
    public String interest;
    
    public Interest()
    {
        i_no=1;
        interest="Database";
    }
	public static boolean exists(ArrayList <Interest> interests,int x)
   {
	   Interest interest=new Interest();
	   for(int i=0; i<interests.size();i++)
	   {
		   interest=interests.get(i);
		   if(interest.i_no==x )
			   return true;
	   }
	   return false;
   }
    public void setInterest()
    {
        switch (i_no)
        {
            case 1:
                interest="Database";
                break;
            case 2:
                interest="Web programming";
                break;
            case 3:
                interest="Human Computer Interaction";
                break;
            case 4:
                interest="Data Mining";
                break;
            case 5:
                interest="Software Engineering";
                break;
            case 6:
                interest="Information Retrieval";
                break;
            case 7:
                interest="Software Quality";
                break;
            case 8:
                interest="e-commerce";
                break;
            case 9:
                interest="Management Information Systems";
                break;
            case 10:
                interest="Information Systems";
                break;
        }
    }
    
    public static String getInterest(int i_no)
    {
        String result=new String();
        switch (i_no)
        {
            case 1:
                result="Database";
                break;
            case 2:
                result="Web programming";
                break;
            case 3:
                result="Human Computer Interaction";
                break;
            case 4:
                result="Data Mining";
                break;
            case 5:
                result="Software Engineering";
                break;
            case 6:
                result="Information Retrieval";
                break;
            case 7:
                result="Software Quality";
                break;
            case 8:
                result="e-commerce";
                break;
            case 9:
                result="Management Information Systems";
                break;
            case 10:
                result="Information Systems";
                break; 
        }
        return result;
    }
    
    
}
