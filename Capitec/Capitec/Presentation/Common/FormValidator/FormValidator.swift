//
//  FormValidator.swift
//  Capitec
//
//  Created by Liam Pillaye.
//

import Foundation

@MainActor internal class FormValidator: ObservableObject {
    
    //MARK: PRIVATES
    private var formFields: [FormField] = []
    @Published var forceUpdate: Bool = false
    
    //MARK: PUBLIC FUNCTIONS
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
            
            if let rule = field.rule, rule.required, validationRules(for: field) {
                field.error = rule.errorMessage
                forceUpdate = true
                isValid = false
            }
        }
        
        return isValid
    }
    
    //MARK: PRIVATES FUNCTIONS
    
    private func validationRules(for field: FormField) -> Bool {
        switch field.ruleType {
        case .minMaxIntRule:
            return minMaxIntValdiationRule(for: field)
        case .minOnlyRule:
            return minIntValdiationRule(for: field)
        case .optionsRule:
            return optionsValidationRule(for: field)
        case .none:
            return false
        default:
            return true
        }
    }
    
    
    private func minMaxIntValdiationRule(for field: FormField) -> Bool {
        
        if field.value.isEmpty { return true }
        
        if let rule = field.rule, let maxValue = rule.max, let minValue = rule.min, let intValue = Int(field.value) {
            let minMaxRange = minValue...maxValue
            return !minMaxRange.contains(intValue)
        }
        
        return false
    }
    
    private func minIntValdiationRule(for field: FormField) -> Bool {
        
        if field.value.isEmpty { return true }
        
        if let rule = field.rule, let minValue = rule.min, let intValue = Int(field.value) {
            return !(intValue >= minValue)
        }
        
        return false
    }
    
    private func optionsValidationRule(for field: FormField) -> Bool {
        
        if field.value.isEmpty { return true }
        
        if let rule = field.rule, let options = rule.options {
            return !options.contains(field.value.lowercased())
        }
        
        return false
    }
}


