/*
* Company : Kvp Business Solution 
* Date	  : 02-12-2018
* Author  : Sameer Ranjan
* Description : pageination using Remoting
* History     : N/L
*/
global class PaginationController {
    //This Method Retrieve Account Records
    @RemoteAction 
    global static List<Account> getRecord(){
        return ([Select Id,Name,industry,Rating From Account]);
    }
}