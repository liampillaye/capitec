//
//  ButtonModifier.swift
//  Capitec
//
//  Created by Liam Pillaye.
//

import SwiftUI

struct ButtonModifier: ViewModifier {
  func body(content: Content) -> some View {
    content
      .font(.headline)
      .padding()
      .frame(minWidth: 0, maxWidth: .infinity)
      .foregroundColor(Color.white)
  }
}

