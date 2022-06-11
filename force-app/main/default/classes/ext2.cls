public with sharing class ext2 {
public string ex2{get;set;}
    public static string ex1{get;set;}
public ext2(ApexPages.StandardController controller) { 
    ex2='ex2';
    System.debug(ex2);
}
    public ext2(){
        
    }
}