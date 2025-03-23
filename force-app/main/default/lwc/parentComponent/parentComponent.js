import { LightningElement,api } from 'lwc';
import firsttemp from './parentComponent.html';
import secondtemp from './parentComponent.html';

export default class ParentComponent extends LightningElement {
    @api temp='temp1';
    @api sample='hello';
    constructor(){
        super();
        console.log('parent constructor call');
    }
    connectedCallback(){
        console.log('parent connected callback call');
    }
    renderedCallback(){
        console.log('parent rendered  call back');
    }
    disconnectedCallback(){
        console.log('parent disconnected  call back');

    }
    render(){
        console.log('parent render method');
        if(this.temp=='temp1'){
            return secondtemp;
        }
        else {
            return firsttemp;
        }
    }
}