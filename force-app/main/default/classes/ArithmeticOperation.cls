/***************************************************************************************************************
 * @created By : KVP
 * @created Date : 06/10/2018
 * @Class Name : ArithmeticOperation
 * @Description : This class have Arithmetic Methods
 * **************************************************************************************************************
 * Modification History : 
 * Method Name : 
 ************************************************************************/
public class ArithmeticOperation {
   //This Metod Add Two Number
   public Double addTwoNumber(Double x,Double y){
       return x+y;
   }
   //This Method Subtract Two Number
   public Double substractTwoNumber(Double x,Double y){
       return y>x?(y-x):(x-y);
   }
   //This Method Divid Two Number
   public Double dividTwoNumber(Double x,Double y){
       return x>y?(x/y):(y/x);
   }
   //This Method Multipy Two Number
   public Double multiplyTwoNumber(Double x,Double y){
       return x*y;
   }
}