import { LightningElement, api } from 'lwc';

export default class DateSelector extends LightningElement {
    @api reportedDate = '2021-05-15T00:00:00.000Z';
    @api proposedDate;
    
    // Backend data from May 2019 to May 2021
    backendData = {
        '2019': {
            may: '800',
            june: '900',
            july: '1000',
            august: '1100',
            september: '1200',
            october: '1300',
            november: '1400',
            december: '1500'
        },
        '2020': {
            january: '1600',
            february: '1700',
            march: '1800',
            april: '1900',
            may: '2000',
            june: '2100',
            july: '2200',
            august: '2300',
            september: '2400',
            october: '2500',
            november: '2600',
            december: '2700'
        },
        '2021': {
            january: '2800',
            february: '2900',
            march: '3000',
            april: '3100',
            may: '3200'
        }
    };
    
    paymentData = [];
    columns = [
        {
            label: 'Type',
            fieldName: 'type',
            type: 'text',
            fixedWidth: 100,
            editable: false
        },
        {
            label: 'Year',
            fieldName: 'year',
            type: 'text',
            fixedWidth: 100,
            editable: false
        },
        {
            label: 'January',
            fieldName: 'january',
            type: 'text',
            editable: (row) => row.type === 'Proposed' && this.backendData[row.year]?.january
        },
        {
            label: 'February',
            fieldName: 'february',
            type: 'text',
            editable: (row) => row.type === 'Proposed' && this.backendData[row.year]?.february
        },
        {
            label: 'March',
            fieldName: 'march',
            type: 'text',
            editable: (row) => row.type === 'Proposed' && this.backendData[row.year]?.march
        },
        {
            label: 'April',
            fieldName: 'april',
            type: 'text',
            editable: (row) => row.type === 'Proposed' && this.backendData[row.year]?.april
        },
        {
            label: 'May',
            fieldName: 'may',
            type: 'text',
            editable: (row) => row.type === 'Proposed' && this.backendData[row.year]?.may
        },
        {
            label: 'June',
            fieldName: 'june',
            type: 'text',
            editable: (row) => row.type === 'Proposed' && this.backendData[row.year]?.june
        },
        {
            label: 'July',
            fieldName: 'july',
            type: 'text',
            editable: (row) => row.type === 'Proposed' && this.backendData[row.year]?.july
        },
        {
            label: 'August',
            fieldName: 'august',
            type: 'text',
            editable: (row) => row.type === 'Proposed' && this.backendData[row.year]?.august
        },
        {
            label: 'September',
            fieldName: 'september',
            type: 'text',
            editable: (row) => row.type === 'Proposed' && this.backendData[row.year]?.september
        },
        {
            label: 'October',
            fieldName: 'october',
            type: 'text',
            editable: (row) => row.type === 'Proposed' && this.backendData[row.year]?.october
        },
        {
            label: 'November',
            fieldName: 'november',
            type: 'text',
            editable: (row) => row.type === 'Proposed' && this.backendData[row.year]?.november
        },
        {
            label: 'December',
            fieldName: 'december',
            type: 'text',
            editable: (row) => row.type === 'Proposed' && this.backendData[row.year]?.december
        }
    ];
    
    connectedCallback() {
        this.updatePaymentTable();
        this.testEditableCells();
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
            this.createRowsForDateRange(2019, proposedYear, proposedDate);
        }
    }

    createInitialRows(reportedYear) {
        // Create rows from 2019 to 2021
        for (let year = 2021; year >= 2019; year--) {
            const reportedRow = this.createRow(year, 'Reported');
            const proposedRow = this.createRow(year, 'Proposed');
            
            // Fill reported row with backend data
            if (this.backendData[year]) {
                Object.keys(this.backendData[year]).forEach(month => {
                    reportedRow[month] = this.backendData[year][month];
                });
            }
            
            this.paymentData.push(reportedRow, proposedRow);
        }
    }

    createRowsForDateRange(startYear, proposedYear, proposedDate) {
        for (let year = proposedYear; year >= startYear; year--) {
            const reportedRow = this.createRow(year, 'Reported');
            const proposedRow = this.createRow(year, 'Proposed');
            
            // Fill reported row with backend data if available
            if (this.backendData[year]) {
                Object.keys(this.backendData[year]).forEach(month => {
                    reportedRow[month] = this.backendData[year][month];
                });
            }
            
            this.fillMonthValues(reportedRow, proposedRow, year, startYear, proposedYear, proposedDate);
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

    fillMonthValues(reportedRow, proposedRow, year, startYear, proposedYear, proposedDate) {
        const months = ['january', 'february', 'march', 'april', 'may', 'june', 
                       'july', 'august', 'september', 'october', 'november', 'december'];
        
        for (let month of months) {
            this.fillReportedRowMonth(reportedRow, month, year, startYear, proposedYear, proposedDate);
            this.fillProposedRowMonth(proposedRow, month, year, startYear, proposedYear, proposedDate);
        }
    }

    fillReportedRowMonth(reportedRow, month, year, startYear, proposedYear, proposedDate) {
        const months = ['january', 'february', 'march', 'april', 'may', 'june', 
                       'july', 'august', 'september', 'october', 'november', 'december'];
        const monthIndex = months.indexOf(month);
        const proposedMonthIndex = months.indexOf(this.getMonthFieldName(proposedDate.getMonth()));
        
        // If this is the proposed year and month is after proposed date, make it empty
        if (year === proposedYear && monthIndex > proposedMonthIndex) {
            reportedRow[month] = '';
        }
        // If this is a year after the proposed year, make all months empty
        else if (year > proposedYear) {
            reportedRow[month] = '';
        }
        // For other cases, use backend data if available
        else if (this.backendData[year] && this.backendData[year][month]) {
            reportedRow[month] = this.backendData[year][month];
        }
    }

    fillProposedRowMonth(proposedRow, month, year, startYear, proposedYear, proposedDate) {
        const months = ['january', 'february', 'march', 'april', 'may', 'june', 
                       'july', 'august', 'september', 'october', 'november', 'december'];
        const monthIndex = months.indexOf(month);
        const proposedMonthIndex = months.indexOf(this.getMonthFieldName(proposedDate.getMonth()));
        
        // If year is before 2021 (reported date year), make all cells blank
        if (year < 2021) {
            proposedRow[month] = '';
        }
        // If year is 2021, make May blank and show YXZ from June onwards
        else if (year === 2021) {
            if (monthIndex <= months.indexOf('may')) {
                proposedRow[month] = '';
            } else {
                proposedRow[month] = 'YXZ';
            }
        }
        // For years after 2021
        else if (year === proposedYear) {
            if (monthIndex > proposedMonthIndex) {
                proposedRow[month] = '';
            } else {
                proposedRow[month] = 'YXZ';
            }
        } else if (year < proposedYear && year > 2021) {
            proposedRow[month] = 'YXZ';
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

    testEditableCells() {
        // Test reported rows
        const reportedRows = this.paymentData.filter(row => row.type === 'Reported');
        reportedRows.forEach(row => {
            // Test Type column
            const typeColumn = this.columns.find(col => col.fieldName === 'type');
            if (typeColumn.editable !== false) {
                console.error('Type column should not be editable for reported rows');
            }
            
            // Test Year column
            const yearColumn = this.columns.find(col => col.fieldName === 'year');
            if (yearColumn.editable !== false) {
                console.error('Year column should not be editable for reported rows');
            }
            
            // Test month columns
            this.columns.forEach(col => {
                if (col.fieldName !== 'type' && col.fieldName !== 'year') {
                    const isEditable = col.editable(row);
                    if (isEditable) {
                        console.error(`Month column ${col.fieldName} should not be editable for reported rows`);
                    }
                }
            });
        });

        // Test proposed rows
        const proposedRows = this.paymentData.filter(row => row.type === 'Proposed');
        proposedRows.forEach(row => {
            // Test Type column
            const typeColumn = this.columns.find(col => col.fieldName === 'type');
            if (typeColumn.editable !== false) {
                console.error('Type column should not be editable for proposed rows');
            }
            
            // Test Year column
            const yearColumn = this.columns.find(col => col.fieldName === 'year');
            if (yearColumn.editable !== false) {
                console.error('Year column should not be editable for proposed rows');
            }
            
            // Test month columns
            this.columns.forEach(col => {
                if (col.fieldName !== 'type' && col.fieldName !== 'year') {
                    const isEditable = col.editable(row);
                    const hasBackendData = this.backendData[row.year]?.[col.fieldName];
                    if (isEditable !== hasBackendData) {
                        console.error(`Month column ${col.fieldName} should only be editable if there is backend data`);
                    }
                }
            });
        });
    }
}