/******************************************************************
* @Created by  : Sameer Ranjan
* @Created Date: 06/10/2018
* @Class Name  : DataTypeClassExample
* @Description : To make use of DataType in salesforce.
*******************************************************************/
public class DataTypeClassExample {
    public String inputstring;
    public DataTypeClassExample(String str){
    inputstring=str;
    }
    public DataTypeClassExample(){
    }
    //This Method show the use of  string function.
    public void stringMethod(){
        //charAt function return Ascii code of character at index
        System.debug('***************chatAt()***********************');
        System.debug('String Sameer Character At Index 2='+String.fromCharArray( new List<integer> { inputstring.charAt(0) } ));
        //abbreviate(10) Method add '...' after 10 index
        System.debug('***************abbreviate(10)***********************');
        System.debug('abbreviate='+inputstring.abbreviate(10));
        System.debug('***************abbreviate(9,6)********************************');
        System.debug(inputstring.abbreviate(10,6));
        //Use of ContainsOnly() Function
        String s1 = 'abbacddaacc';
        Boolean b1 = s1.containsOnly('abcd');
        System.debug(b1);
        //Use of hashCode() Function()
        System.debug('hashCode of String='+inputstring.hashCode());
        //Use of containsIgnoreCase() function
        System.debug('containsIgnoreCase of string='+inputstring.containsIgnoreCase('Sa'));
        //use of compareTo
        String myString1 = 'abcde';
        String myString2 = 'ajkjk';
        Integer result = 
        myString1.compareTo(myString2);
        System.debug('compareTo() ofn string='+result);
        //use of difference() Method 
        String FirstString='Sameer Ranjan';
        System.debug('Difference() Function ='+FirstString.difference(inputstring));
    }
}