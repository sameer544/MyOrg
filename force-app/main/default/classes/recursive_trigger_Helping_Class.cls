public class recursive_trigger_Helping_Class {
    public static void updateContact(){
        Contact con=[select Id,Name,Lastname from contact][0];
        con.lastname='xyz';
        update con;
    }
}