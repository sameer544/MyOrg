import { LightningElement } from 'lwc';
import firsttemp from './childComponent.html';
import secondtemp from './childComponent.html';

export default class ChildComponent extends LightningElement {
    constructor(){
        super();
        console.log('chld constructor call');
    }
    connectedCallback(){
        console.log('child connected callback');
    }
    renderedCallback(){
        console.log('child rendered callback');
    }

    render(){
            console.log('child render method');
            if(this.temp=='temp1'){
                return secondtemp;
            }
            else {
                return firsttemp;
            }
        }
}