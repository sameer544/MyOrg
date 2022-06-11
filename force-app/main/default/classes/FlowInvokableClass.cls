public inherited sharing class FlowInvokableClass {
    public static void callFlowMethod(){
        List<Account> listAccount = [Select Id from Account];
        Map<String,Object> params = new Map<String,Object>();
        params.put('Record', listAccount);
        Flow.Interview.TestFlow callFlow = new Flow.Interview.TestFlow(params);
        callFlow.start();
    }
}