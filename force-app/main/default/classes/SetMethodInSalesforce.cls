/**********************************************************
*@Created By   : Sameer Ranjan
*@Created Date : 07/10/2018
*@Class Name   : ListMethodInSalesforce
*@Description  : Use of List Class Method
***********************************************************/
public class SetMethodInSalesforce {
     public static void doSetMethodDemo(){
        List<Integer> intList=new List<Integer>();
        intList.addAll(new List<Integer>{1,3,4,4,5,6,8,9});
        System.debug('------->'+intList.size());
        Set<Integer> setList = new Set<Integer>();
        setList.add(1);
        setList.add(2);
        setList.add(4);
        System.debug('------->'+setList.size());
        intList.addAll(setList);
        System.debug('------->'+intList.size());
        System.debug('***********************SET METHODS *********************');
        System.debug('1. Emlements in this list='+intList);
        setList.addAll(intList);
        System.debug('2. Emlements in this set='+intList.add(90));
        Set<Integer> setList2 = new Set<Integer>();
        setList2.addAll(setList);
        System.debug('3. Emlements in this set='+setList2);
        setList.add(13);
        setList.add(14);
        System.debug('4. Emlements in this set='+setList+'====>'+setList2);
        setList.add(23);
        setList.clear();
        System.debug('5. Emlements in this set='+setList.size());
        setList2.addAll(setList.clone());
        System.debug('6. Emlements in this set2='+setList2);
        System.debug('7. contains check ='+setList2.contains(90));
        System.debug('8. contains all check='+setList2.containsAll(new set<Integer>{1,2}));
        System.debug('9. hash code of myset ='+setList2.hashCode());
        System.debug('10. is Empty ?'+setList2.isEmpty());
    	System.debug('11. remove '+setList2.remove(1));
        System.debug('12. remove '+setList2.remove(2));
        System.debug('13. setList2'+setList2);
        List<Integer> removeSet = new List<Integer>{90,20,3,1};
        System.debug('14. removeAll'+setList2.removeAll(removeSet));
        System.debug('15. setList2'+setList2);
        //setList2.clear();
        List<Integer> abcValue = new List<Integer>{3,0};
        System.debug('15. is retains all ?'+setList2.retainAll(abcValue));
        System.debug('set1'+setList);
        System.debug('set2'+setList2);
        setList.clear();
        System.debug('set1'+setList);
        System.debug('set2'+setList2);
        System.debug('15. is retains all ?'+setList2.retainAll(setList));
        System.debug('set2'+setList);
        System.debug('15. is retains all ?'+setList2.retainAll(setList));
        System.debug('********************************************************');
    }
}