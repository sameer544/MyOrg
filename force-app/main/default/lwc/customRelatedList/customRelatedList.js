import { LightningElement, api, track } from "lwc";
import getRelatedListRecords from "@salesforce/apex/CustomRelatedListController.getRelatedListRecords";
import handleSearch from "@salesforce/apex/CustomRelatedListController.handleSearch";
import { updateRecord } from "lightning/uiRecordApi";
import { ShowToastEvent } from "lightning/platformShowToastEvent";
import { RefreshEvent } from "lightning/refresh";

export default class CustomRelatedList extends LightningElement {
  @api recordId;
  @api childObjectRelationshipAPIName;
  @api childObjectRelationshipLabel;
  @api fields;
  @track relatedList = [];
  @track selectedRows;
  error;
  @track errors = {};
  @track errorMessages = [];
  @track columns = [];
  recordToBeUpdated = [];

  connectedCallback() {
    console.log("lwc onload");
    try {
      this.getRelatedListData();
      this.error = undefined;
    } catch (error) {
      this.error = error;
    }
  }

  async getRelatedListData() {
    try {
      let parameterObject = {
        relationShipFieldAPIName: this.childObjectRelationshipAPIName,
        seletedFields: this.fields,
        recordId: this.recordId
      };
      let returnMap = await getRelatedListRecords({
        requestParams: parameterObject
      });
      this.relatedList = returnMap.data;
      this.columns = returnMap.columns;
      console.log("relatedList" + JSON.stringify(this.relatedList));
      console.log("columns" + JSON.stringify(returnMap.columns));
      this.error = undefined;
    } catch (error) {
      this.relatedList = undefined;
      this.error = error;
      console.error(error);
    }
  }

  handleSave(event) {
    try {
      this.recordToBeUpdated = event.detail.draftValues;
      const inputsItems = this.recordToBeUpdated.slice().map((draft) => {
        const fields = Object.assign({}, draft);
        return { fields };
      });
      const promises = inputsItems.map((recordInput) =>
        updateRecord(recordInput)
      );
      Promise.all(promises)
        .then((res) => {
          console.log(res);
          this.dispatchEvent(
            new ShowToastEvent({
              title: "Success",
              message: "Records Updated Successfully!!",
              variant: "success"
            })
          );
          this.recordToBeUpdated = [];
          this.getRelatedListData();
          this.dispatchEvent(new RefreshEvent());
        })
        .catch((error) => {
          let fieldErrors = error?.body?.output?.fieldErrors;
          let errorMessage = fieldErrors == undefined ? error.message : "";
          for (let element in fieldErrors) {
            errorMessage = fieldErrors[element][0].message;
          }
          this.dispatchEvent(
            new ShowToastEvent({
              title: "Error",
              message: "" + errorMessage,
              variant: "error"
            })
          );
          this.error = error;
          console.error(error);
        });
    } catch (error) {
      this.dispatchEvent(
        new ShowToastEvent({
          title: "Error",
          message: error.message,
          variant: "error"
        })
      );
      console.error(error);
    }
  }

  async searchRecords(event) {
    try {
      let searchTerm = event.detail.value;
      let parameterObject = {
        relationShipFieldAPIName: this.childObjectRelationshipAPIName,
        seletedFields: this.fields,
        recordId: this.recordId,
        searchKey: searchTerm
      };
      let returnMap = await handleSearch({
        requestParams: parameterObject
      });
      this.relatedList = returnMap.data;
      //this.columns = returnMap.columns;
      console.log("relatedList" + JSON.stringify(this.relatedList));
      this.error = undefined;
    } catch (error) {
      console.error(error);
      this.dispatchEvent(
        new ShowToastEvent({
          title: "Error",
          message: error.body.message,
          variant: "error"
        })
      );
    }
  }

  handleRowSelection(event) {
    this.selectedRows = event.detail.selectedRows;
    console.log(this.selectedRows);
  }

  handleMassUpdate(event) {
    console.log("mass update");
    if (this.selectedRows === undefined) {
      console.log("no record");
      this.dispatchEvent(
        new ShowToastEvent({
          title: "Error",
          message: "Select atleast one record!",
          variant: "error"
        })
      );
      return;
    }
    if (this.selectedRows.length == 0) {
      console.log("no record selected");
      this.dispatchEvent(
        new ShowToastEvent({
          title: "Error",
          message: "Select atleast one record!",
          variant: "error"
        })
      );
    }
  }

  handleCancel(event) {
  }

  handleRowAction(event){

  }
}