import { LightningElement, track, api } from "lwc";
import ImperativeReturnCase from "@salesforce/apex/PopulateDataTable.returnCase";
import SendStringifiedSelection from "@salesforce/apex/PopulateDataTable.buildResourceObject";
export default class ShowModal extends LightningElement {
  @track bshowModal = false;
  @api recordId;
  @track columns = [
    { label: "CaseNumber", fieldName: "CaseNumber", type: "text" },
    { label: "Status", fieldName: "Status", type: "text" },
    { label: "Priority", fieldName: "Priority", type: "text" }
  ];
  @track data;
  @track error;
  @track theSelectRow = [];

  openModal() {
    this.bshowModal = true;
  }
  closeModal() {
    this.bshowModal = false;
  }
  searchModal() {
    ImperativeReturnCase()
      .then(result => {
        this.data = result;
      })
      .catch(error => {
        this.error = error;
      });
  }
  getSelectRow(event) {
    console.log("selection Event");
    this.theSelectRow = event.detail.selectedRows;
  }
  saveModal() {
    console.log("The selected rows :" + JSON.stringify(this.theSelectRow));
    SendStringifiedSelection({
        updateStr:JSON.stringify(this.theSelectRow)
    });
  }
}
