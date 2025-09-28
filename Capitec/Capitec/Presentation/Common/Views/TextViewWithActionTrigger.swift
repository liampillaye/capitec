//
//  TextInputViewWithAction.swift
//  Capitec
//
//  Created by Liam Pillaye.
//

import SwiftUI

struct TextViewWithActionTrigger: View {
    
    var title: String
    var placeholder: String
    @State private var editing: Bool = false
    @Binding var text: String
    @Binding var error: String?
    var keyboardType: UIKeyboardType = .default
    var tapGestureTriggerAction: () -> Void
        
    //MARK: BODY
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(title)
                .foregroundColor(
                    error != nil ? Color(Constants.Colors.inputValidationErrorColor) : (editing ? Color(Constants.Colors.primaryThemeColor) : Color(Constants.Colors.textColor))
                )
                .bodySubtitleStyle()
            
            Text(placeholder)
                .keyboardType(keyboardType)
                .foregroundColor(Color(Constants.Colors.placeholderColor))
                .padding(.top, 4)

                
            
            Rectangle()
                .foregroundColor(
                    error != nil ? Color(Constants.Colors.inputValidationErrorColor) : (editing ?  Color(Constants.Colors.primaryThemeColor) : Color(Constants.Colors.textColor))
                )
                .frame(height: 1)
                .padding(.top, 11)
            
            if let error = error {
                HStack {
                    Image(systemName: "exclamationmark.circle")
                        .foregroundColor(Color(Constants.Colors.inputValidationErrorColor))
                    
                    Text(error)
                        .foregroundColor(Color(Constants.Colors.inputValidationErrorColor))
                        .bodySubtitleStyle()
                }
                .padding(.top, 11)
            }
        }//:VSTACK
        .onTapGesture {
            tapGestureTriggerAction()
        }
        .padding()
    }//:BODY
}

//MARK: PREVIEW
#Preview {
    TextViewWithActionTrigger(
        title: "What is your age?",
        placeholder: "Age",
        text: .constant(""),
        error: .constant(nil),
        keyboardType: .numberPad) {
            //Do something
        }
        .padding()
}
