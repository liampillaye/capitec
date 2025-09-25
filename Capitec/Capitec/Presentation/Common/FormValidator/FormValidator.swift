//
//  FormValidator.swift
//  Capitec
//
//  Created by Liam Pillaye.
//

import Foundation

@MainActor internal final class FormValidator {
    private var formFields: [FormField] = []

    func addFields(fields: [FormField]) {
        self.formFields = fields
    }
    
    @discardableResult func validate() -> Bool {
        var isValid = true
        
        formFields.forEach { field in
            if field.value.isEmpty {
                field.error = "\(field.fieldName) field is required"
                isValid = false
            }
            
//            if let regex = field.regex, !regex.matches(in:)(field.value) {
//                field.error = "\(field.fieldName) invalid"
//                isValid = false
//            }
        }
        
        return isValid
    }
}


