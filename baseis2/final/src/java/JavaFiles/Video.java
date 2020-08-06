package JavaFiles;
import java.sql.Date;

public class Video {
   public int s_no;
   public int v_no;
   public  String video;
    
    
public Video()
{
    video="https://www.youtube.com/embed/u9Dg-g7t2l4";
}
    
public String embed(String temp)
{
// Anywhere in string
int b = temp.indexOf("watch?v=");         // epistrefei to shmeio pou bre8hke 
String n = temp.substring(0,b)+"embed/"+temp.substring(b+8);
return n;
//out.println(user1.embed("https://www.youtube.com/watch?v=2XKcEKK0sOY"));
}
}
