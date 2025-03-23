import { LightningElement, api } from "lwc";
import LightningConfirm from "lightning/confirm";
export default
class recordCardQuickFiles extends LightningElement {
 @api
 recordId;
 async onDeleteAllFilesButtonClick() {
  const result = await LightningConfirm.open({
            message: 'Are you sure you want to delete all files?',
            variant: 'headerless',
            label: 'Are you sure you want to delete all files?',
            // setting theme would have no effect
        });
        //Confirm has been closed
        //result is true if OK was clicked
        //and false if cancel was clicked
  }
}