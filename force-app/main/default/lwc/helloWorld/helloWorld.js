import { LightningElement, api, track } from 'lwc';
export default class HelloWorld extends LightningElement {
  greeting = 'World';
  @track trackname = 'track';
  @api nameapi = 'api';
  changeHandler(event) {
    this.greeting = event.target.value;
    this.trackname = + '' + event.target.value;
    this.nameapi = + '' + event.target.value;
  }
}