trigger recursive_trigger on Account (after update) {
     if(AvoidRecursion.isFirstRun())
    recursive_trigger_Helping_Class.updateContact();
}