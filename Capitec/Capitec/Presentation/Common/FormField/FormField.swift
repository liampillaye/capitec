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
    
    init(for fieldName: String,
         value: String = "",
         error: String? = nil) {
        self.fieldName = fieldName
        self.value = value
        self.error = error
    }
}
