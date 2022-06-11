import { LightningElement, track } from 'lwc';
import callApexService from '@salesforce/apex/chattingComponentApexController.callMethod'

export default class ChattingComponent extends LightningElement {
    @track returnValue;
    @track userInput;
    @track error;
    
    onChangeInput(event){
        this.userInput = event.currentTarget.value;
    }

    handleClick(event) {
        callApexService({ userInput: this.userInput })
            .then(result => {
                this.returnValue = result;
            })
            .catch(error => {
                this.error = error;
            });
    }
}