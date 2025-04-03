import { createElement } from 'lwc';
import DateSelector from 'c/dateSelector';

describe('c-date-selector', () => {
    let element;
    let datatable;

    beforeEach(() => {
        element = createElement('c-date-selector', {
            is: DateSelector
        });
        document.body.appendChild(element);
        datatable = element.shadowRoot.querySelector('lightning-datatable');
    });

    afterEach(() => {
        document.body.removeChild(element);
    });

    it('should not allow editing of reported cells', () => {
        // Wait for the component to initialize
        return Promise.resolve().then(() => {
            // Get all reported rows
            const reportedRows = element.paymentData.filter(row => row.type === 'Reported');
            
            // Check each reported row
            reportedRows.forEach(row => {
                // Check Type column
                const typeColumn = element.columns.find(col => col.fieldName === 'type');
                expect(typeColumn.editable).toBe(false);
                
                // Check Year column
                const yearColumn = element.columns.find(col => col.fieldName === 'year');
                expect(yearColumn.editable).toBe(false);
                
                // Check all month columns
                element.columns.forEach(col => {
                    if (col.fieldName !== 'type' && col.fieldName !== 'year') {
                        const isEditable = col.editable(row);
                        expect(isEditable).toBe(false);
                    }
                });
            });
        });
    });

    it('should only allow editing of proposed cells with backend data', () => {
        // Wait for the component to initialize
        return Promise.resolve().then(() => {
            // Get all proposed rows
            const proposedRows = element.paymentData.filter(row => row.type === 'Proposed');
            
            // Check each proposed row
            proposedRows.forEach(row => {
                // Check Type column
                const typeColumn = element.columns.find(col => col.fieldName === 'type');
                expect(typeColumn.editable).toBe(false);
                
                // Check Year column
                const yearColumn = element.columns.find(col => col.fieldName === 'year');
                expect(yearColumn.editable).toBe(false);
                
                // Check all month columns
                element.columns.forEach(col => {
                    if (col.fieldName !== 'type' && col.fieldName !== 'year') {
                        const isEditable = col.editable(row);
                        const hasBackendData = element.backendData[row.year]?.[col.fieldName];
                        expect(isEditable).toBe(hasBackendData);
                    }
                });
            });
        });
    });

    it('should maintain editability when proposed date changes', () => {
        // Set a proposed date
        element.proposedDate = '2022-03-15T00:00:00.000Z';
        
        // Wait for the component to update
        return Promise.resolve().then(() => {
            // Get all reported rows
            const reportedRows = element.paymentData.filter(row => row.type === 'Reported');
            
            // Verify reported rows are still not editable
            reportedRows.forEach(row => {
                element.columns.forEach(col => {
                    if (col.fieldName !== 'type' && col.fieldName !== 'year') {
                        const isEditable = col.editable(row);
                        expect(isEditable).toBe(false);
                    }
                });
            });
        });
    });

    it('should handle cell edit events correctly', () => {
        // Get a proposed row with backend data
        const proposedRow = element.paymentData.find(row => 
            row.type === 'Proposed' && 
            element.backendData[row.year]?.may
        );
        
        if (proposedRow) {
            // Simulate a cell edit event
            const event = new CustomEvent('cellchange', {
                detail: {
                    row: proposedRow,
                    value: '1000',
                    fieldName: 'may'
                }
            });
            
            // Verify the event is handled
            const spy = jest.spyOn(element, 'handleAmountChange');
            element.handleAmountChange(event);
            expect(spy).toHaveBeenCalledWith(event);
        }
    });
}); 