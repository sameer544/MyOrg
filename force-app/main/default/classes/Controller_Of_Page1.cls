public class Controller_Of_Page1 {
    public Property_Class value{get;set;}
    public Controller_Of_Page1(){
        value=new Property_Class();
        value.hidden='false';
    }
    public void Cleardata(){
        value=new Property_Class();
        value.hidden='false';
    }
    public void calculator(){
        value.hidden='true';
        value.Result=null;
        value.label1='Sum='+(value.Value1+value.Value2);
        value.label2='multiplication='+(value.Value1*value.Value2);
        value.label3='subtraction='+(value.Value1-value.Value2);
        if(value.Value2!=0){
        value.label4='divition='+(value.Value1/value.Value2);
        }
        else{
          value.label4='Infinity';
        }
    }
    public void add(){
        value.hidden='false';
        value.Result=(value.Value1+value.Value2);
    }
     public void mult(){
        value.hidden='false';
        value.Result=(value.Value1*value.Value2);
    }
     public void div(){
        value.hidden='false';
         if(value.Value2!=0){
        value.Result=(value.Value1/value.Value2);
        }
        else{
          value.Result=0;
        }
    }
     public void sub(){
        value.hidden='false';
        value.Result=(value.Value1-value.Value2);
    }
}