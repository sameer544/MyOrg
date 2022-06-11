import { LightningElement, track } from 'lwc';

import highChart from '@salesforce/resourceUrl/highChart';

import jqueryResource from '@salesforce/resourceUrl/JQueryFile';

import { loadScript, loadStyle } from 'lightning/platformResourceLoader';

import { ShowToastEvent } from 'lightning/platformShowToastEvent';


export default class HighchartDemo extends LightningElement {
    @track error;
    @track successMessage = '';

    renderedCallback() { // invoke the method when component rendered or loaded
        Promise.all([
            //loadStyle(this, leafletResource +'/leaflet.css'), // CSS File
            //loadScript(this, leafletResource + '/leaflet.js'),  // leaflet js file
            //loadScript(this, chartJSResource + '/Chart.min.js'), // chart js file
            loadScript(this, highChart), // jquery script
            loadScript(this, jqueryResource ),
        ])
            .then(() => {
                this.error = undefined;
                // Call back function if scripts loaded successfully
                 Highcharts.chart({
                    chart: {
                        renderTo: this.template.querySelector('.name'),
                        zoomType: 'xy'
                    },
                    title: {
                        text: 'NSOH Amount Monthly wise'
                    },
                    xAxis: [{
                        categories: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
                            'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
                        crosshair: true
                    }],
                    yAxis: [{ // Primary yAxis
                        labels: {
                            format: '{value} L',
                            style: {
                                color: Highcharts.getOptions().colors[1]
                            }
                        },
                        title: {
                            text: 'NSOH (L)',
                            style: {
                                color: Highcharts.getOptions().colors[1]
                            }
                        }
                    }, { // Secondary yAxis
                        title: {
                            text: 'NSOH (L)',
                            style: {
                                color: Highcharts.getOptions().colors[0]
                            }
                        },
                        labels: {
                            format: '{value} L',
                            style: {
                                color: Highcharts.getOptions().colors[0]
                            }
                        },
                        opposite: true
                    }],
                    tooltip: {
                        shared: true
                    },
                    legend: {
                        layout: 'vertical',
                        align: 'left',
                        x: 120,
                        verticalAlign: 'top',
                        y: 100,
                        floating: true,
                        backgroundColor:
                            Highcharts.defaultOptions.legend.backgroundColor || // theme
                            'rgba(255,255,255,0.25)'
                    },
                    series: [{
                        name: 'Indivisual',
                        type: 'column',
                        yAxis: 1,
                        data: [49.9, 71.5, 106.4, 129.2, 144.0, 176.0, 135.6, 148.5, 216.4, 194.1, 95.6, 54.4],
                        tooltip: {
                            valueSuffix: ' L'
                        }

                    }, {
                        name: 'Org',
                        type: 'spline',
                        data: [7.0, 6.9, 9.5, 14.5, 18.2, 21.5, 25.2, 26.5, 23.3, 18.3, 13.9, 9.6],
                        tooltip: {
                            valueSuffix: 'L'
                        }
                    },
                    {
                        name: 'Region',
                        type: 'spline',
                        data: [49.9, 71.5, 106.4, 129.2, 144.0, 176.0, 135.6, 148.5, 216.4, 194.1, 95.6, 54.4],
                        tooltip: {
                            valueSuffix: 'L'
                        }
                    }
                    ]
                });
                //this.showSuccessMessage();
            })
            .catch(error => {
                this.error = error;
                this.dispatchEvent(
                    new ShowToastEvent({
                        title: 'Error!!',
                        message: error.message,
                        variant: 'error',
                    }),
                );
            });

    }
    showSuccessMessage() { // call back method 
        this.successMessage = 'Scripts are loaded successfully!!';
        alert('Scripts are loaded successfully!!!');
    }
}