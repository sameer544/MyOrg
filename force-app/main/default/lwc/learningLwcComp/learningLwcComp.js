import { LightningElement } from 'lwc';
export default class LearningLwcComp extends LightningElement {
    constructor(){
        super();
        console.log('constructor call');
    }
    
    renderedCallback(){
        console.log('renderedCallback call');
    }
    disconnectedCallback(){
        console.log('disconnectedCallback call');
    }
    connectedCallback(){
        console.log('connectedCallback call');
    }
}