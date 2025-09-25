//
//  PrimaryButton.swift
//  Capitec
//
//  Created by Liam Pillaye.
//

import SwiftUI

struct PrimaryButton: View {
    // MARK: - PROPERTIES
    var buttonTitle: String
    var isDisabled: Bool
    var buttonAction: () -> Void
        
    //MARK: BODY
    var body: some View {
        Button {
            buttonAction()
        } label: {
            Text(buttonTitle.uppercased())
              .modifier(ButtonModifier())
        }
        .disabled(isDisabled)
        .background(Capsule().fill(isDisabled ? .gray : Color(Constants.Colors.primaryThemeColor)))
        .padding(20)
    }
}


#Preview {
    PrimaryButton(buttonTitle: "Go Next", isDisabled: false) {
        //Do nothing
    }
}
