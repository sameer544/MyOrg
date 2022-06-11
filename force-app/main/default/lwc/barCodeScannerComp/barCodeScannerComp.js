import { LightningElement } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import { getBarcodeScanner } from 'lightning/mobileCapabilities';
export default class MultipleScan extends LightningElement {
    myScanner;
    scannedBarcode1 = '';
    scanButtonDisabled = false;
    scannedBarcode = '';
    // When component is initialized, detect whether to enable Scan button
    connectedCallback() {
        this.myScanner = getBarcodeScanner();
        if (this.myScanner == null || !this.myScanner.isAvailable()) {
            this.scanButtonDisabled = true;
        }
    }
    handleBeginScanClick(event) {
        this.scannedBarcode = '';
        if (this.myScanner != null && this.myScanner.isAvailable()) {
            const scanningOptions = {
                barcodeTypes: [
                this.myScanner.barcodeTypes.CODE_128
                ]
            };
            this.myScanner
                .beginCapture(scanningOptions)
                .then((result) => {
                    console.log(result);
                    this.scannedBarcode = decodeURIComponent(result.value);
                    this.dispatchEvent(
                        new ShowToastEvent({
                            title: 'Successful Scan',
                            message: 'Barcode scanned successfully.',
                            variant: 'success'
                        })
                    );
                })
                .catch((error) => {
                    console.error(error);
                    this.dispatchEvent(
                         new ShowToastEvent({
                           title: 'Barcode Scanner Error',
                           message:'There was a problem scanning the barcode: ' +
                                    JSON.stringify(error) +' Please try aga in.',
                           variant: 'error',
                           mode: 'sticky'
                        })
                   );
                })
                .finally(() => {

                    this.scanAgain();
                });
        } else {

            console.log('Scan Barcode button should be disabled and unclickable.');
            console.log(event);
            this.dispatchEvent(
                new ShowToastEvent({
                    title: 'Barcode Scanner Is Not Available',
                    message: 'Try again from the Salesforce app on a mobile device.',
                    variant: 'error'
                })
            );
        }

    }

    scanAgain(event){
        this.scannedBarcode +='againscanned';
        if (this.myScanner != null && this.myScanner.isAvailable()) {
            const scanningOptions = {
                barcodeTypes: [
                this.myScanner.barcodeTypes.EAN_13,
                this.myScanner.barcodeTypes.EAN_8,
                ]
            };
            this.myScanner
                .beginCapture(scanningOptions)
                .then((result) => {
                    console.log(result);
                    this.scannedBarcode += decodeURIComponent(result.value);
                    this.dispatchEvent(
                        new ShowToastEvent({
                            title: 'Successful Scan',
                            message: 'Barcode scanned successfully.',
                            variant: 'success'
                        })
                    );
                })
                .catch((error) => {
                    console.error(error);
                    this.dispatchEvent(
                         new ShowToastEvent({
                           title: 'Barcode Scanner Error',
                           message:'There was a problem scanning the barcode: ' +
                                    JSON.stringify(error) +' Please try aga in.',
                           variant: 'error',
                           mode: 'sticky'
                        })
                   );
                })
                .finally(() => {

                    this.myScanner.endCapture();
                });
        } else {

            console.log('Scan Barcode button should be disabled and unclickable.');
            console.log(event);
            this.dispatchEvent(
                new ShowToastEvent({
                    title: 'Barcode Scanner Is Not Available',
                    message: 'Try again from the Salesforce app on a mobile device.',
                    variant: 'error'
                })
            );
        }
    }
}