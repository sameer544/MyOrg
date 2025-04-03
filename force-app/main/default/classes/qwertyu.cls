public class qwertyu {
    public List<String> valueData{get;set;}
    public qwertyu(){
        system.debug(JSON.serialize(ApexPages.currentPage().getParameters()));
    }
public void downdoc() {
         valueData = new List<String>();
     //   proj = [SELECT Id, Name, MC_Scope__c, Pre_Commissioning_Scope__c, Model_Type__c FROM Project_Setup__c where id =: ProjID];
       List<Account> doc = [SELECT Id FROM Account ];
         system.debug(doc);
        if(doc.size() > 0){
         // integer i = 0;
            for(Account d : doc){
               system.debug(d);
                PageReference  pageRef = new PageReference('/apex/AccountVF');
                pageRef.setRedirect(true);
                //pageRef.getParameters().put('DocumentID',d.Id);
                //pageRef.getParameters().put('DocMid',d.Document_Master__c);
               //i++;
                valueData.add('"'+EncodingUtil.base64Encode(pageRef.getContent())+'"');
               // return pageRef;
                             
            }
        }
       
       
    }
}