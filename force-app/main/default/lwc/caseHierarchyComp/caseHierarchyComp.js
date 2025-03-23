import { LightningElement, api, wire, track } from 'lwc';
import getCaseList from '@salesforce/apex/CaseHierarchyApexController.getCaseRecordList'
import previous from '@salesforce/apex/CaseHierarchyApexController.previous'
import next from '@salesforce/apex/CaseHierarchyApexController.next'
import { refreshApex } from '@salesforce/apex';
export default class CaseHierarchyComp extends LightningElement {
    recoId;
    firstCaseId;
    lastCaseId;
    disabeledNextButton = false;
    comparingId;
    disabeledPreButton = true;
    isLoaded = false;
    
    @api 
    get recordId(){
        return this.recoId;
    }
    set recordId(val){
        this.recoId = val;
    }
    items = [];
    @wire(getCaseList, { recordIdInfo: '$recoId'})
    wiredRecordsMethod({ error, data }) {
        this.isLoaded = true;
        console.log('data' + JSON.stringify(data));
        if (data) {
            this.isLoaded = false;
            this.items = data.caseInfo;
            this.firstCaseId = data.firstCaseId;
            this.comparingId = data.firstCaseId;
            this.lastCaseId = data.lastCaseId;
            this.isMoreThanRequiredSize = data.isMoreThanConstantValue;
            console.log(data.isMoreThanConstantValue);
            if(!data.isMoreThanConstantValue)
            this.disabeledNextButton = !data.isMoreThanConstantValue;
        } else if (error) {
            console.error(error);
        }
    }

    handlePre(){
        console.log('this.firstCaseId' + this.firstCaseId);
        this.isLoaded = true;
        previous({ recordIdInfo: this.recoId , previousRecordId : this.firstCaseId })
		.then(data => {
            this.isLoaded = false;
            console.log('data' + JSON.stringify(data));
			this.items = data.caseInfo;
            this.firstCaseId = data.firstCaseId;
            this.lastCaseId = data.lastCaseId;
            this.isMoreThanRequiredSize = data.isMoreThanConstantValue;
            console.log(data.isMoreThanConstantValue);
            if(this.comparingId == data.firstCaseId){
                this.disabeledPreButton = true;
            }
            if(data.isMoreThanConstantValue)
            this.disabeledNextButton = !data.isMoreThanConstantValue;

		})
		.catch(error => {
			console.error(error);
		})
    }

    handleNext(){
        this.isLoaded = true;
        next({ recordIdInfo: this.recoId , nextRecordId : this.lastCaseId })
		.then(data => {
        this.isLoaded = false;
            console.log('data' + JSON.stringify(data));
			this.items = data.caseInfo;
            this.firstCaseId = data.firstCaseId;
            this.lastCaseId = data.lastCaseId;
            this.isMoreThanRequiredSize = data.isMoreThanConstantValue;
            console.log(data.isMoreThanConstantValue);
            if(this.comparingId != data.firstCaseId){
                this.disabeledPreButton = false;
            }
            if(!data.isMoreThanConstantValue)
            this.disabeledNextButton = !data.isMoreThanConstantValue;
		})
		.catch(error => {
			console.error(error);
		})
    }
}