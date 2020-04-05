import { LightningElement, track } from "lwc";

export default class SimpleCalculator extends LightningElement {
  @track result;
  @track previousResult = [];
  @track showPreviousResults = false;
  num1;
  num2;

  handleNumChange(event) {
    if (event.target.name === "input1") {
      this.num1 = event.target.value;
    } else {
      this.num2 = event.target.value;
    }
  }

  handleSumClick() {
    // eslint-disable-next-line radix
    this.result = parseInt(this.num1) + parseInt(this.num2);
    this.previousResult.push(this.result);
  }
  handleSubClick() {
    // eslint-disable-next-line radix
    this.result = parseInt(this.num1) - parseInt(this.num2);
    this.previousResult.push(this.result);
  }
  handleDivClick() {
    // eslint-disable-next-line radix
    this.result = parseInt(this.num1) / parseInt(this.num2);
    this.previousResult.push(this.result);
  }
  //Comment for multipliction
  handleMultiClick() {
    // eslint-disable-next-line radix
    this.result = parseInt(this.num1) * parseInt(this.num2);
    this.previousResult.push(this.result);
  }

  showPreviousResultToggle(event){
    this.showPreviousResults = event.target.checked;
}
}
