trigger DecWithNameAndCreatedDate on Account (after insert) {
    Help_Class.insertaccount(Trigger.new);
}