public class Duplicate_Contact_Number {
    public static void ValidateContactNumber(Contact con1){
        List<Contact> conListOldRecord=[Select Id,Phone From Contact];
        map<String,boolean> Oldphonenumber=new map<String,boolean>();
        for(Contact con:conListOldRecord)
            Oldphonenumber.put(con.phone,true);
           if(Oldphonenumber.containsKey(con1.phone))
                con1.adderror('Itgysameervvs Already Exist');
    }
}