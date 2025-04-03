import { LightningElement } from "lwc";
import { loadStyle, loadScript } from "lightning/platformResourceLoader";

import exampleFile from "@salesforce/resourceUrl/ExampleFile";

export default class MyComponent extends LightningElement {
  renderedCallback() {
    console.log(exampleFile);
    loadScript(this, exampleFile).then((e)=>
    {
    var test= e.exampleFile;
    });
    Promise.all([
      loadScript(this, exampleFile) //specified filename
    ])
      .then((e) => {
        console.log("Files loaded.");
        console.log(e);
        console.dir(e);
        console.log(exampleFile);

        //console.log(this.exampleFile.val);
        // myClick.bind(this);
      })
      .catch((error) => {
        console.dir(error);
        //window.console.log("Error " + error.body.message);
      });
  }

  onClick() {
    //exampleFile.myClick();
    loadScript(this, exampleFile)
      .then(() => {
        console.log("click");
      })
      .catch((error) => {
        console.dir(error);
      });
  }
}