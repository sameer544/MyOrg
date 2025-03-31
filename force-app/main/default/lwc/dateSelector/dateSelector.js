import { LightningElement, api } from 'lwc';

export default class DateSelector extends LightningElement {
    @api reportedDate = '2021-05-15T00:00:00.000Z';
    @api proposedDate;
    
    paymentData = [];
    columns = [
        {
            label: 'Type',
            fieldName: 'type',
            type: 'text',
            fixedWidth: 100
        },
        {
            label: 'Year',
            fieldName: 'year',
            type: 'text',
            fixedWidth: 100
        },
        {
            label: 'January',
            fieldName: 'january',
            type: 'text'
        },
        {
            label: 'February',
            fieldName: 'february',
            type: 'text'
        },
        {
            label: 'March',
            fieldName: 'march',
            type: 'text'
        },
        {
            label: 'April',
            fieldName: 'april',
            type: 'text'
        },
        {
            label: 'May',
            fieldName: 'may',
            type: 'text'
        },
        {
            label: 'June',
            fieldName: 'june',
            type: 'text'
        },
        {
            label: 'July',
            fieldName: 'july',
            type: 'text'
        },
        {
            label: 'August',
            fieldName: 'august',
            type: 'text'
        },
        {
            label: 'September',
            fieldName: 'september',
            type: 'text'
        },
        {
            label: 'October',
            fieldName: 'october',
            type: 'text'
        },
        {
            label: 'November',
            fieldName: 'november',
            type: 'text'
        },
        {
            label: 'December',
            fieldName: 'december',
            type: 'text'
        }
    ];
    
    connectedCallback() {
        this.updatePaymentTable();
    }
    
    handleProposedDateChange(event) {
        this.proposedDate = event.target.value;
        this.updatePaymentTable();
        this.dispatchEvent(new CustomEvent('datechange', {
            detail: {
                reportedDate: this.reportedDate,
                proposedDate: this.proposedDate,
                paymentData: this.paymentData
            }
        }));
    }
    
    updatePaymentTable() {
        const reportedDate = new Date(this.reportedDate);
        const reportedYear = reportedDate.getFullYear();
        const reportedMonth = reportedDate.getMonth();
        this.paymentData = [];
        
        // If no proposed date is selected, only show 2021 rows
        if (!this.proposedDate) {
            // Create reported row for 2021
            const reportedRow2021 = {
                id: `reported_${reportedYear}`,
                type: 'Reported',
                year: reportedYear,
                january: '',
                february: '',
                march: '',
                april: '',
                may: '1000',
                june: '',
                july: '',
                august: '',
                september: '',
                october: '',
                november: '',
                december: ''
            };
            
            // Create proposed row for 2021
            const proposedRow2021 = {
                id: `proposed_${reportedYear}`,
                type: 'Proposed',
                year: reportedYear,
                january: '',
                february: '',
                march: '',
                april: '',
                may: '',
                june: '',
                july: '',
                august: '',
                september: '',
                october: '',
                november: '',
                december: ''
            };
            
            this.paymentData.push(reportedRow2021, proposedRow2021);
            return;
        }
        
        // If proposed date is selected and valid
        if (this.isDateValid) {
            const proposedDate = new Date(this.proposedDate);
            const proposedYear = proposedDate.getFullYear();
            const proposedMonth = proposedDate.getMonth();
            
            // Create rows for each year from proposed year to reported year (descending order)
            for (let year = proposedYear; year >= reportedYear; year--) {
                // Create reported row
                const reportedRow = {
                    id: `reported_${year}`,
                    type: 'Reported',
                    year: year,
                    january: '',
                    february: '',
                    march: '',
                    april: '',
                    may: '',
                    june: '',
                    july: '',
                    august: '',
                    september: '',
                    october: '',
                    november: '',
                    december: ''
                };
                
                // Create proposed row
                const proposedRow = {
                    id: `proposed_${year}`,
                    type: 'Proposed',
                    year: year,
                    january: '',
                    february: '',
                    march: '',
                    april: '',
                    may: '',
                    june: '',
                    july: '',
                    august: '',
                    september: '',
                    october: '',
                    november: '',
                    december: ''
                };
                
                // Set reported amount for 2021 May
                if (year === 2021) {
                    reportedRow.may = '1000';
                }
                
                // Set proposed amount if this is the selected year
                if (year === proposedYear) {
                    proposedRow[this.getMonthFieldName(proposedMonth)] = '1200';
                }
                
                // Fill months between reported and proposed dates with "YYY"
                const months = ['january', 'february', 'march', 'april', 'may', 'june', 
                              'july', 'august', 'september', 'october', 'november', 'december'];
                
                for (let month of months) {
                    const monthIndex = months.indexOf(month);
                    
                    // For reported row
                    if (year === reportedYear) {
                        if (monthIndex > months.indexOf('may')) {
                            reportedRow[month] = '';
                        }
                        else if (month === 'may') {
                            reportedRow[month] = '1000';
                        }
                        else {
                            reportedRow[month] = 'YYY';
                        }
                    } else if (year > reportedYear && year < proposedYear) {
                        reportedRow[month] = 'YYY';
                    } else if (year === proposedYear) {
                        if (monthIndex > months.indexOf(this.getMonthFieldName(proposedMonth))) {
                            reportedRow[month] = '';
                        }
                        else {
                            reportedRow[month] = 'YYY';
                        }
                    }
                    
                    // For proposed row
                    if (year === proposedYear) {
                        if (monthIndex > months.indexOf(this.getMonthFieldName(proposedMonth))) {
                            proposedRow[month] = '';
                        }
                        else if (month === this.getMonthFieldName(proposedMonth)) {
                            proposedRow[month] = '1200';
                        }
                        else {
                            proposedRow[month] = 'YYY';
                        }
                    } else if (year < proposedYear && year > reportedYear) {
                        proposedRow[month] = 'YYY';
                    } else if (year === reportedYear) {
                        if (monthIndex > months.indexOf('may')) {
                            proposedRow[month] = '';
                        }
                        else {
                            proposedRow[month] = 'YYY';
                        }
                    }
                }
                
                // Add both rows to the payment data
                this.paymentData.push(reportedRow, proposedRow);
            }
        }
    }
    
    getMonthFieldName(monthIndex) {
        const months = [
            'january', 'february', 'march', 'april', 'may', 'june',
            'july', 'august', 'september', 'october', 'november', 'december'
        ];
        return months[monthIndex];
    }
    
    handleAmountChange(event) {
        const { row, value, fieldName } = event.detail;
        const updatedPayment = this.paymentData.find(payment => payment.id === row.id);
        if (updatedPayment) {
            updatedPayment[fieldName] = value;
            this.dispatchEvent(new CustomEvent('paymentchange', {
                detail: {
                    paymentData: this.paymentData
                }
            }));
        }
    }
    
    get isDateValid() {
        if (!this.proposedDate) return true;
        return new Date(this.proposedDate) >= new Date(this.reportedDate);
    }
    
    get dateValidationMessage() {
        if (!this.isDateValid) {
            return 'Proposed date cannot be earlier than reported date (May 15, 2021)';
        }
        return '';
    }
} 