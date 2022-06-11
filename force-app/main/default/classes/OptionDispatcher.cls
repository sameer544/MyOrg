public with sharing class OptionDispatcher {
    public static void run(OptionHandler handler) {
        System.debug('run Method');
        if(Trigger.isBefore && Trigger.isUpdate){
            handler.beforeInsertMenthod(Trigger.new);
        }
    }
}