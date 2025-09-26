//
//  FormField.swift
//  Capitec
//
//  Created by Liam Pillaye.
//

import Foundation

enum ValidationRuleType {
    case minMaxIntRule
    case minMaxDoubleRule
    case minOnlyRule
    case optionsRule
    case none
}

@MainActor internal final class FormField: ObservableObject {
    
    //MARK: PUBLIC VARIALBES
    var fieldName: String
    @Published var value: String
    @Published var error: String?
    var rule: ValidationRule?
    var ruleType: ValidationRuleType
    
    //MARK: INITS
    init(for fieldName: String,
         value: String = "",
         error: String? = nil,
         rule: ValidationRule? = nil,
         ruleType: ValidationRuleType = .none) {
        self.fieldName = fieldName
        self.value = value
        self.error = error
        self.rule = rule
        self.ruleType = ruleType
    }
}
