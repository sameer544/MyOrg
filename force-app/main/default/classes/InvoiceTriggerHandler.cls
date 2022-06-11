public class InvoiceTriggerHandler {
	//After Insert Invoice Method Call
    public static void insertInvoice(List<Invoice__c> invoiceRecord){
        Set<Id> accountCustomId=new Set<Id>();
        Set<Id> productCustomId=new Set<Id>();
        Set<Date> Dateof=new Set<Date>();
        Map<String,String> mapOf=new Map<String,String>();
        for(Invoice__c var:invoiceRecord){
            accountCustomId.add(var.AccountCustom__c);
            productCustomId.add(var.ProductCustom__c);
            Dateof.add(var.Date__c);
            mapOf.put(string.valueof(var.AccountCustom__c)+string.valueof(var.ProductCustom__c),var.Value__c+','+var.Status__c);
        }
           List<SchemaCustom__c> Query=[Select Id,Svalue__c,SchemaCustom__c.AccountCustom__c,SchemaCustom__c.ProductCustom__c,SchemaCustom__c.ProductCategory__r.ProductCustom__c from SchemaCustom__c where SchemaCustom__c.AccountCustom__c in:accountCustomId and State_Date__c<=:Dateof and End_Date__c>=:Dateof and (SchemaCustom__c.ProductCustom__c in:productCustomId or  SchemaCustom__c.ProductCategory__r.ProductCustom__c in:productCustomId)];
        System.debug(Query);   
        for(SchemaCustom__c updaterecord:Query){
               if(mapOf.get(string.valueOf(updaterecord.AccountCustom__c)+string.valueOf(updaterecord.ProductCustom__c))!=null){
                   if(mapOf.get(string.valueOf(updaterecord.AccountCustom__c)+string.valueOf(updaterecord.ProductCustom__c)).split(',')[1]!='Connect'){
                       continue;
                   }
                   else{
                   updaterecord.Svalue__c+=Decimal.valueof(mapOf.get(string.valueOf(updaterecord.AccountCustom__c)+string.valueOf(updaterecord.ProductCustom__c)).split(',')[0]);
                   }
               }
               else{
                    if(mapOf.get(string.valueOf(updaterecord.AccountCustom__c)+string.valueOf(updaterecord.ProductCategory__r.ProductCustom__c)).split(',')[1]!='Connect'){
                       continue;
                    }else{
                     updaterecord.Svalue__c+=Decimal.valueof(mapOf.get(string.valueOf(updaterecord.AccountCustom__c)+string.valueOf(updaterecord.ProductCategory__r.ProductCustom__c)).split(',')[0]);
                    }
                 }
        	}
        	Database.update(Query);
    }
    //After Insert Invoice Method Call
    public static void updateInvoiceRecord(List<Invoice__c> invoiceNewRecord,List<Invoice__c> invoiceOldRecord){
        List<SchemaCustom__c> updateRecords=new List<SchemaCustom__c>();
        Set<Id> accountCustomId=new Set<Id>();
        Set<Id> productCustomId=new Set<Id>();
        Set<Date> Dateof=new Set<Date>();
        Map<String,String> mapOf=new Map<String,String>();
        Map<String,String> oldMapof=new Map<String,String>();
        for(Invoice__c var:invoiceNewRecord){
            accountCustomId.add(var.AccountCustom__c);
            productCustomId.add(var.ProductCustom__c);
            Dateof.add(var.Date__c);
            mapOf.put(string.valueof(var.AccountCustom__c)+string.valueof(var.ProductCustom__c),var.Value__c+','+var.Status__c+','+string.valueof(var.AccountCustom__c)+','+string.valueof(var.ProductCustom__c));
         }
           List<SchemaCustom__c> Query=[Select Id,Svalue__c,SchemaCustom__c.AccountCustom__c,SchemaCustom__c.ProductCustom__c,SchemaCustom__c.ProductCategory__r.ProductCustom__c from SchemaCustom__c where SchemaCustom__c.AccountCustom__c in:accountCustomId and State_Date__c<=:Dateof and End_Date__c>=:Dateof and (SchemaCustom__c.ProductCustom__c in:productCustomId or  SchemaCustom__c.ProductCategory__r.ProductCustom__c in:productCustomId)];
           for(SchemaCustom__c updaterecord:Query){
               if(mapOf.get(string.valueOf(updaterecord.AccountCustom__c)+string.valueOf(updaterecord.ProductCustom__c))!=null){
                   if(mapOf.get(string.valueOf(updaterecord.AccountCustom__c)+string.valueOf(updaterecord.ProductCustom__c)).split(',')[1]!='Connect'){
                       continue;
                   }
                   else{
                       updaterecord.Svalue__c=Decimal.valueof(mapOf.get(string.valueOf(updaterecord.AccountCustom__c)+string.valueOf(updaterecord.ProductCustom__c)).split(',')[0]);  
                    }
               }
               else{
                    if(mapOf.get(string.valueOf(updaterecord.AccountCustom__c)+string.valueOf(updaterecord.ProductCategory__r.ProductCustom__c)).split(',')[1]!='Connect'){
                       continue;
                    }else{
                     updaterecord.Svalue__c=Decimal.valueof(mapOf.get(string.valueOf(updaterecord.AccountCustom__c)+string.valueOf(updaterecord.ProductCategory__r.ProductCustom__c)).split(',')[0]);
                    }
                 }
        	}
          updateRecords.addAll(Query);
        accountCustomId.clear();
        productCustomId.clear();
        Dateof.clear();
        //mapOf.clear();
        for(Invoice__c var:invoiceOldRecord){
            accountCustomId.add(var.AccountCustom__c);
            productCustomId.add(var.ProductCustom__c);
            Dateof.add(var.Date__c);
         oldMapOf.put(string.valueof(var.AccountCustom__c)+string.valueof(var.ProductCustom__c),var.Value__c+','+var.Status__c+','+string.valueof(var.AccountCustom__c)+','+string.valueof(var.ProductCustom__c)); 
        }
        	List<SchemaCustom__c> oldMapRecord=new List<SchemaCustom__c>();
           List<SchemaCustom__c> Query1=[Select Id,Svalue__c,SchemaCustom__c.AccountCustom__c,SchemaCustom__c.ProductCustom__c,SchemaCustom__c.ProductCategory__r.ProductCustom__c from SchemaCustom__c where SchemaCustom__c.AccountCustom__c in:accountCustomId and State_Date__c<=:Dateof and End_Date__c>=:Dateof and (SchemaCustom__c.ProductCustom__c in:productCustomId or  SchemaCustom__c.ProductCategory__r.ProductCustom__c in:productCustomId)];
           for(SchemaCustom__c updaterecord:Query1){
               if(oldMapOf.get(string.valueOf(updaterecord.AccountCustom__c)+string.valueOf(updaterecord.ProductCustom__c))!=NULL){
                    if(oldMapOf.get(string.valueOf(updaterecord.AccountCustom__c)+string.valueOf(updaterecord.ProductCustom__c))!=null){
                   if(oldMapOf.get(string.valueOf(updaterecord.AccountCustom__c)+string.valueOf(updaterecord.ProductCustom__c)).split(',')[1]!='Connect'){
                       continue;
                   }
                   else{
                   updaterecord.Svalue__c=0;
                    oldMapRecord.add(updaterecord);
                   }
               }
               else{
                    if(oldMapOf.get(string.valueOf(updaterecord.AccountCustom__c)+string.valueOf(updaterecord.ProductCategory__r.ProductCustom__c)).split(',')[1]!='Connect'){
                       continue;
                    }else{
                     updaterecord.Svalue__c=0;
                     oldMapRecord.add(updaterecord);
                    }
                 }
               }
        	}
        if(oldMapRecord.size()!=0)
        updateRecords.addAll(oldMapRecord);
        Database.update(updateRecords);
    }
}