public class Approval_Controller {
    public List<ProcessInstance> procinst{get;set;}
    public string comments{get;set;}
    public string selectedaction{get;set;}
    public List<SelectOption> selectActionPickList{get;set;}
    public boolean rendardNorecord{get;set;}
    public Approval_Controller(){
        procinst=new List<ProcessInstance>();
       selectActionPickList=new List<SelectOption>();
        selectActionPickList.add(new selectOption('Approve','Approve'));
        selectActionPickList.add(new selectOption('Reject','Reject'));
       //List<Workitem> ob=new List<Workitem>();
        List<ProcessInstance> newprocinst=[select id,TargetObjectId,status,(select id,actor.name from Workitems) from ProcessInstance where status='Pending'];
        for(ProcessInstance listofrecord:newprocinst){
            if(listofrecord.Workitems[0].actorid==userinfo.getUserId()){
                procinst.add(listofrecord);
            }
        }
        if(procinst.size()==0)
        rendardNorecord=true;
        else
         rendardNorecord=false;
    }
    public void ApproveAllRecord(){
        for(ProcessInstance var:procinst){
        Approval.ProcessWorkitemRequest req =new Approval.ProcessWorkitemRequest();
        req.setComments(''+comments);
        req.setAction(''+selectedaction);
        List<ProcessInstanceWorkitem> workitem=[Select p.Id from ProcessInstanceWorkitem p where p.ProcessInstance.TargetObjectId =: var.TargetObjectId];        
        req.setNextApproverIds(new Id[] {UserInfo.getUserId()});
        req.setWorkitemId(workitem[0].Id);
        Approval.process(req);
        }
        comments=null;
        procinst.clear();
    }
}