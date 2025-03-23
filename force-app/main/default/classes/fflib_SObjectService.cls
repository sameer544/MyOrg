public virtual class fflib_SObjectService {
    private fflib_ISObjectUnitOfWork unitOfWork;
    
    public fflib_SObjectService() {
        this(null);
    }
    
    public fflib_SObjectService(fflib_ISObjectUnitOfWork unitOfWork) {
        this.unitOfWork = unitOfWork;
    }
    
    protected virtual void setUnitOfWork(fflib_ISObjectUnitOfWork unitOfWork) {
        this.unitOfWork = unitOfWork;
    }
    
    protected virtual fflib_ISObjectUnitOfWork getUnitOfWork() {
        return unitOfWork;
    }
    
    protected virtual void commitWork() {
        if(unitOfWork != null) {
            unitOfWork.commitWork();
        }
    }
} 