package JavaFiles;
import java.sql.Date;

public class School {
    public String institution;
    public String facultry;
    public String department;
    public int school;
	
public static String getInstitution(int i_no)
    {
        String result=new String();
        switch (i_no)
        {
            case 100100:
            case 100101:
            case 101100:
                result="Αριστοτέλειο Πανεπιστήμιο Θεσσαλονίκης";
                break;
            case 200100:
                result="Δημοκρίτειο Πανεπιστήμιο Θράκης";
                break;
            case 300100:
                result="Εθνικό Μετσόβιο Πολυτεχνείο";
                break;
            case 400100:
                result="Εθνικό Καποδιστριακό Πανεπιστήμιο Αθηνών";
                break;
            case 500100:
                result="Οικονομικό Πανεπιστήμιο Αθηνών";
                break;
            case 600100:
                result="Πανεπιστήμιο Πειραιός";
                break;
            case 700100:
                result="ΤΕΙ Αθήνας";
                break;
            case 800100:
                result="ΤΕΙ Κρήτης";
                break;
             
        }
		return result;
}


public static String fromEtoG(String inst)
    {
        String result=new String();
        switch (inst)
        {
            case "Aristoteleio Panepisthmio Thessalonikkis":
                result="Αριστοτέλειο Πανεπιστήμιο Θεσσαλονίκης";
                break;
            case "Dhmokriteio Panepisthmio Thrakis":
                result="Δημοκρίτειο Πανεπιστήμιο Θράκης";
                break;
            case "Ethniko Metsobio Polutexneio":
                result="Εθνικό Μετσόβιο Πολυτεχνείο";
                break;
            case "Ethniko Kapodistriako Panepisthmio Athinwn":
                result="Εθνικό Καποδιστριακό Πανεπιστήμιο Αθηνών";
                break;
            case "Oikonomiko Panepisthmio Athinwn":
                result="Οικονομικό Πανεπιστήμιο Αθηνών";
                break;
            case "Panepisthmio Peiraios":
                result="Πανεπιστήμιο Πειραιός";
                break;
            case "Tei of Athens":
                result="ΤΕΙ Αθήνας";
                break;
            case "Tei of Crete":
                result="ΤΕΙ Κρήτης";
                break;
             
        }
		return result;
}

}
