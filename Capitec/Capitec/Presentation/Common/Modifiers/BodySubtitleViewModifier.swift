//
//  BodySubtitleViewModifier.swift
//  Capitec
//
//  Created by Liam Pillaye.
//

import SwiftUI

struct BodySubtitleViewModifier: ViewModifier {
    let fontWeight: Font.Weight
    
    func body(content: Content) -> some View {
        content
            .font(Font.system(size: 14, weight: fontWeight))
            .foregroundColor(Color(Constants.Colors.navigationBarSubtitleColor))
            .multilineTextAlignment(.leading)
    }
}

extension View {
    func bodySubtitleStyle(fontWeight: Font.Weight = .regular) -> some View {
        self.modifier(BodySubtitleViewModifier(fontWeight: fontWeight))
    }
}
