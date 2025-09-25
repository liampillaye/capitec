//
//  FormValidator.swift
//  Capitec
//
//  Created by Liam Pillaye.
//

import Foundation

@MainActor internal final class FormValidator: ObservableObject {
    private var formFields: [FormField] = []
    
    @Published var forceUpdate: Bool = false
    
    func addFields(fields: [FormField]) {
        self.formFields = fields
    }
    
    func addRule(for fieldName: String, rule: ValidationRule) {
        if let index = formFields.firstIndex(where: { $0.fieldName == fieldName }) {
            formFields[index].rule = rule
        }
    }
    
    @discardableResult func validate() -> Bool {
        var isValid = true
        
        formFields.forEach { field in
            
            if let rule = field.rule, rule.required{
                field.error = rule.errorMessage
                forceUpdate = true
                isValid = false
            }
        }
    
        return isValid
    }
}


