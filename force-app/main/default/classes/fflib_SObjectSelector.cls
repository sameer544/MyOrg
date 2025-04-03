/**
 * Copyright (c), FinancialForce.com, inc
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without modification, 
 *   are permitted provided that the following conditions are met:
 *
 * - Redistributions of source code must retain the above copyright notice, 
 *      this list of conditions and the following disclaimer.
 * - Redistributions in binary form must reproduce the above copyright notice, 
 *      this list of conditions and the following disclaimer in the documentation 
 *      and/or other materials provided with the distribution.
 * - Neither the name of the FinancialForce.com, inc nor the names of its contributors 
 *      may be used to endorse or promote products derived from this software without 
 *      specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND 
 *  ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES 
 *  OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL 
 *  THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, 
 *  EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
 *  OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY
 *  OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
 *  ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
**/

/**
 * Class providing common database query support for abstracting and encapsulating query logic
 **/
public abstract class fflib_SObjectSelector {
    private Boolean enforceObjectSecurity;
    private Boolean includeSelectorFields;
    
    public fflib_SObjectSelector() {
        this(true, true);
    }
    
    public fflib_SObjectSelector(Boolean enforceObjectSecurity, Boolean includeSelectorFields) {
        this.enforceObjectSecurity = enforceObjectSecurity;
        this.includeSelectorFields = includeSelectorFields;
    }
    
    abstract Schema.SObjectType getSObjectType();
    
    abstract List<Schema.SObjectField> getSObjectFieldList();
    
    public virtual String getOrderBy() {
        return 'Name';
    }
    
    public List<SObject> selectSObjectsById(Set<Id> idSet) {
        return Database.query(
            String.format('SELECT {0} FROM {1} WHERE Id IN :idSet ORDER BY {2}', 
            new List<String>{
                getFieldListString(),
                getSObjectName(),
                getOrderBy()
            })
        );
    }
    
    private String getFieldListString() {
        List<String> fieldList = new List<String>();
        for(Schema.SObjectField field : getSObjectFieldList()) {
            fieldList.add(field.getDescribe().getName());
        }
        return String.join(fieldList, ',');
    }
    
    private String getSObjectName() {
        return getSObjectType().getDescribe().getName();
    }
    
    public Boolean isEnforcingObjectSecurity() {
        return enforceObjectSecurity;
    }
}