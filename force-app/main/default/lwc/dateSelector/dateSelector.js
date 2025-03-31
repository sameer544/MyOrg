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
        this.paymentData = [];
        
        if (!this.proposedDate) {
            this.createInitialRows(reportedYear);
            return;
        }
        
        if (this.isDateValid) {
            const proposedDate = new Date(this.proposedDate);
            const proposedYear = proposedDate.getFullYear();
            this.createRowsForDateRange(reportedYear, proposedYear, proposedDate);
        }
    }

    createInitialRows(reportedYear) {
        const reportedRow = this.createRow(reportedYear, 'Reported');
        reportedRow.may = '1000';
        
        const proposedRow = this.createRow(reportedYear, 'Proposed');
        
        this.paymentData.push(reportedRow, proposedRow);
    }

    createRowsForDateRange(reportedYear, proposedYear, proposedDate) {
        for (let year = proposedYear; year >= reportedYear; year--) {
            const reportedRow = this.createRow(year, 'Reported');
            const proposedRow = this.createRow(year, 'Proposed');
            
            this.setSpecialValues(reportedRow, proposedRow, year, proposedYear, proposedDate);
            this.fillMonthValues(reportedRow, proposedRow, year, reportedYear, proposedYear, proposedDate);
            
            this.paymentData.push(reportedRow, proposedRow);
        }
    }

    createRow(year, type) {
        return {
            id: `${type.toLowerCase()}_${year}`,
            type: type,
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
    }

    setSpecialValues(reportedRow, proposedRow, year, proposedYear, proposedDate) {
        // Set reported amount for 2021 May
        if (year === 2021) {
            reportedRow.may = '1000';
        }
        
        // Set proposed amount if this is the selected year
        if (year === proposedYear) {
            proposedRow[this.getMonthFieldName(proposedDate.getMonth())] = '1200';
        }
    }

    fillMonthValues(reportedRow, proposedRow, year, reportedYear, proposedYear, proposedDate) {
        const months = ['january', 'february', 'march', 'april', 'may', 'june', 
                       'july', 'august', 'september', 'october', 'november', 'december'];
        
        for (let month of months) {
            this.fillReportedRowMonth(reportedRow, month, year, reportedYear, proposedYear, proposedDate);
            this.fillProposedRowMonth(proposedRow, month, year, reportedYear, proposedYear, proposedDate);
        }
    }

    fillReportedRowMonth(reportedRow, month, year, reportedYear, proposedYear, proposedDate) {
        const months = ['january', 'february', 'march', 'april', 'may', 'june', 
                       'july', 'august', 'september', 'october', 'november', 'december'];
        const monthIndex = months.indexOf(month);
        
        if (year === reportedYear) {
            if (monthIndex > months.indexOf('may')) {
                reportedRow[month] = '';
            } else if (month === 'may') {
                reportedRow[month] = '1000';
            } else {
                reportedRow[month] = 'YYY';
            }
        } else if (year > reportedYear && year < proposedYear) {
            reportedRow[month] = 'YYY';
        } else if (year === proposedYear) {
            if (monthIndex > months.indexOf(this.getMonthFieldName(proposedDate.getMonth()))) {
                reportedRow[month] = '';
            } else {
                reportedRow[month] = 'YYY';
            }
        }
    }

    fillProposedRowMonth(proposedRow, month, year, reportedYear, proposedYear, proposedDate) {
        const months = ['january', 'february', 'march', 'april', 'may', 'june', 
                       'july', 'august', 'september', 'october', 'november', 'december'];
        const monthIndex = months.indexOf(month);
        
        if (year === proposedYear) {
            if (monthIndex > months.indexOf(this.getMonthFieldName(proposedDate.getMonth()))) {
                proposedRow[month] = '';
            } else if (month === this.getMonthFieldName(proposedDate.getMonth())) {
                proposedRow[month] = '1200';
            } else {
                proposedRow[month] = 'YYY';
            }
        } else if (year < proposedYear && year > reportedYear) {
            proposedRow[month] = 'YYY';
        } else if (year === reportedYear) {
            if (monthIndex > months.indexOf('may')) {
                proposedRow[month] = '';
            } else {
                proposedRow[month] = 'YYY';
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