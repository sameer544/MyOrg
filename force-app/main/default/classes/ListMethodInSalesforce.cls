/**********************************************************
*@Created By   : Sameer Ranjan
*@Created Date : 07/10/2018
*@Class Name   : ListMethodInSalesforce
*@Description  : Use of List Class Method
***********************************************************/
public class ListMethodInSalesforce {
    //Method
   public static void doListMethodsDemo(){
            List<Integer> intList = new List<Integer>();
            for(Integer i=0;i<20;i++){
                intList.add(i);
            }
            List<Integer> intList1 = new List<Integer>(intList);
            System.debug('**********************LIST METHODS**************************');
            System.debug('1. Size of the list ='+intList.size());
            System.debug('2. Parameterised Constructor of list='+intList1.size());
            intList1.clear();
            System.debug('3. Clearing a value of list='+intList1.size());
            List<Integer> intList2 = intList;
            System.debug('4. Size of the list ='+intList2.size());
            intList2.add(10);
            intList2.add(0,11);
            intList.add(56);
            intList2.addAll(intList);
            intList.add(50);
            System.debug('5. Size of the list ='+intList2.size()+'(00000)'+intList.size());
            System.debug('***Removing a value from list ***');
            System.debug('6.Remove a value from List='+intList.remove(0));
            System.debug('7. size of list ='+intList.size());
            System.debug('8. contains in list='+intList.contains(11));
            System.debug('9. size of list ='+intList[0]);
            System.debug('10. size of list ='+intList[0]);
            intList.add(0,135);
            intList.set(0,140);
            System.debug('11. size of list ='+intList[0]);
            System.debug('12. size of list ='+intList[1]);
            List<Integer> intList3 = intList.clone();
            System.debug('13. size of int list 3='+intList3.size());
            intList.add(9000);
            System.debug('14. size of iterator list 3='+intList3.iterator());
            intList2=intList3;
            intList1=intList2;
            intList3.sort();
            System.debug('14. size of iterator list 3='+intList3);
            System.debug('15. size of iterator list 2='+intList2);
            System.debug('15. size of iterator list 1='+intList1);
    	}
}