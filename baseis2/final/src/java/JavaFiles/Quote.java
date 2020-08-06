package JavaFiles;
import java.sql.Date;

public class Quote {
    public int q_no;
    public int s_no;
    public String quote;
    public Date date;
    
    public Quote()
    {
        quote="my quote";
        date= new Date(1,1,1);
    }
	public Quote(int qno,int sno,String qquote,Date qdate)
	{
		s_no=sno;
		q_no=qno;
        quote=qquote;
        date= qdate;
        }
	
}
