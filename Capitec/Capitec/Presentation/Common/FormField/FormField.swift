//
//  FormField.swift
//  Capitec
//
//  Created by Liam Pillaye.
//

import Foundation

@MainActor internal final class FormField {
    var fieldName: String
    @Published var value: String
    @Published var error: String?
    var rule: ValidationRule?
    
    init(for fieldName: String,
         value: String = "",
         error: String? = nil,
         rule: ValidationRule? = nil) {
        self.fieldName = fieldName
        self.value = value
        self.error = error
        self.rule = rule
    }
}
