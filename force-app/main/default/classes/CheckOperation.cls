/***************************************************************************************************************
 * @created By : Sameer Ranjan
 * @created Date : 06/10/2018
 * @Class Name : CheckOperation
 * @Description : This class use ArithmeticOperation class method and pass value.
 * **************************************************************************************************************
 * Modification History : 
 * Method Name : 
 ************************************************************************/
public class CheckOperation {
   //Create ArithmeticOperation Object
    ArithmeticOperation ob=new ArithmeticOperation();
    //variable that initilize by checkOperation constractor
    Double x,y;
    //CheckOperation Constractor
    public CheckOperation(Double a,Double b){this.x=a;this.y=b;}
    //This Method Use Arithmetic Operation Method which declare ArithmeticOperation class 
    public Double OprationMethod(String op){
      //switch statement
      switch on op.toLowerCase() {
         when 'add' {return ob.addTwoNumber(this.x,this.y);}
         when 'sub' {return ob.substractTwoNumber(this.x,this.y);}
         when 'div'{return ob.dividTwoNumber(this.x,this.y);}
         when 'mul'{return ob.multiplyTwoNumber(this.x,this.y);}
         when else {return 0;}
      }
    }
}