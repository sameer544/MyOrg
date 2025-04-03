public with sharing class ext1 {
    public static string ex1{get;set;}
    public ext2 ob;
    public ext1(ApexPages.StandardController controller) {
		ex1='ex1';
        ob=new ext2(controller);
        System.debug(ex1);
    }
}