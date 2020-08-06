package JavaFiles;
import java.sql.Date;

public class Language {
    public int s_no;
    public String language;
    public String level;
    
    public Language()
    {
        language="Greek";
        level="perfectly";
    }
    
    public Language(int no,String lang,String lev)
    {
        s_no=no;
        language=lang;
        while (lev!="well" || lev!="perfectly" || lev!="not so well")
            //na diabazei to level
        level=lev;
    }
}
