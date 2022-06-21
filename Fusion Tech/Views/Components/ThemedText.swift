//
//  ThemedText.swift
//  Fusion Tech
//
//  Created by Fusion Tech on 04.06.2022.
//

import SwiftUI

struct ThemedText: View {
    let text: String
    let size: CGFloat
    let weight: Font.Weight
    
    init(text: String, size: CGFloat = 16.0, weight: Font.Weight = .medium) {
        self.text = text
        self.size = size
        self.weight = weight
    }
    
    var body: some View {
        Text(text)
            .foregroundColor(FONT_COLOR)
            .font(.system(size: size))
            .fontWeight(weight)
    }
}

struct ThemedText_Previews: PreviewProvider {
    static var previews: some View {
        ThemedText(text: "Test")
    }
}
