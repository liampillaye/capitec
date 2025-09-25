//
//  TextInputView.swift
//  Capitec
//
//  Created by Liam Pillaye.
//

import SwiftUI


struct TextInputView: View {
    
    var title: String
    var placeholder: String
    @State private var editing: Bool = false
    @Binding var text: String
    @Binding var error: String?
    var keyboardType: UIKeyboardType = .default
    
    //MARK: BODY
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(title)
                .foregroundColor(
                    error != nil ? Color(Constants.Colors.InputValidationErrorColor) : (editing ? Color(Constants.Colors.AccentColor) : Color(Constants.Colors.TextColor))
                )
                .bodySubtitleStyle()
            
            TextField(
                placeholder,
                text: $text,
                onEditingChanged: {
                    editing = $0
                    if $0 {
                        error = nil
                    }
                }
            )
            .keyboardType(keyboardType)
            .foregroundColor(Color(Constants.Colors.TextColor))
            .padding(.top, 4)
            
            Rectangle()
                .foregroundColor(
                    error != nil ? Color(Constants.Colors.InputValidationErrorColor) : (editing ?  Color(Constants.Colors.AccentColor) : Color(Constants.Colors.TextColor))
                )
                .frame(height: 1)
                .padding(.top, 11)
            
            if let error = error {
                HStack {
                    Image(systemName: "exclamationmark.circle")
                        .foregroundColor(Color(Constants.Colors.InputValidationErrorColor))
                    
                    Text(error)
                        .foregroundColor(Color(Constants.Colors.InputValidationErrorColor))
                        .bodySubtitleStyle()
                }
                .padding(.top, 11)
            }
        }//:VSTACK
        .padding()
    }//:BODY
}

//MARK: PREVIEW
#Preview {
    TextInputView(
        title: "What is your age?",
        placeholder: "Age",
        text: .constant(""),
        error: .constant(nil),
        keyboardType: .numberPad)
        .padding()
}
