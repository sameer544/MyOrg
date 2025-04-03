public class Q5Controller {
    
 /***************************************************************************************************
 * Created By 	: Sameer Ranjan
 * Created Date : 26-11-108
 * Class Name 	: Q5Controller
 * Description 	: Develop a vf page which should contain all the arthimetic operators and their implementation.
 * *************************************************************************************************/
    
    //Result
    public double result{get;set;}
    
    //A Wrapper class
    public class WrapperClassTwoValue{
        public double value1{get;set;}
        public double value2{get;set;}
    }
    
    //Wrapper Class reference which have two Integer Value
    public WrapperClassTwoValue values{get;set;}
    
    //Contractor
    public Q5Controller(){
        values=new WrapperClassTwoValue();
    }
    //Arthimetic Addition 
    public void Addition(){
         if(values.value1!=null && values.value2!=null){
            result=values.value1+values.value2;
        }
        else{
            ApexPages.addmessage(new ApexPages.message(ApexPages.severity.FATAL,'Please Enter values'));
        }
    }
    
    //Arthimetic Substaction
    public void subtraction(){
          if(values.value1!=null && values.value2!=null){
            result=values.value1-values.value2;
        }
        else{
            ApexPages.addmessage(new ApexPages.message(ApexPages.severity.FATAL,'Please Enter values'));
        }
    }
    
    //Arthimetic Division
    public void Division(){
         if(values.value1!=null && values.value2!=null){
             if(values.value2!=0)
            result=values.value1/values.value2;
             else
			ApexPages.addmessage(new ApexPages.message(ApexPages.severity.FATAL,'infinity'));             
        }
        else{
            ApexPages.addmessage(new ApexPages.message(ApexPages.severity.FATAL,'Please Enter values'));
        }
    }
    
    //Arthimetic multiplication
    public void multiplication(){
         if(values.value1!=null && values.value2!=null){
            result=values.value1*values.value2;
        }
        else{
            ApexPages.addmessage(new ApexPages.message(ApexPages.severity.FATAL,'Please Enter values'));
        }
    }
}