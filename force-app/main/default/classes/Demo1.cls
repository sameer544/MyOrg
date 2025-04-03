public class Demo1 {
    public void Updaterecorde(){
        List<Account> Acclist=[Select Id,Name,Description from Account];
        for(Account var:Acclist){
            var.Description='hello';
        }
        Update Acclist;
        
    }
}