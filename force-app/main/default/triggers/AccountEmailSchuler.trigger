trigger AccountEmailSchuler on Account (After insert) {
    for(Account acc:Trigger.New){
        integer mit=integer.valueof(System.now().minute())+1;
        Integer hor=System.now().hour();
        if(mit/60>0){
            mit=math.mod(mit,60);
            hor++;
        }
        schulerApex ob=new schulerApex(acc);
        String cronExpression='0 '+mit+' '+hor+' '+System.now().day()+' '+System.now().month()+' ? '+System.now().Year()+'';
        System.debug(cronExpression);
    System.Schedule('EmailUpdate',cronExpression,ob);      
    } 
}