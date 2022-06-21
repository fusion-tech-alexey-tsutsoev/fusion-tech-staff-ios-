//
//  ImageButton.swift
//  Fusion Tech
//
//  Created by Fusion Tech on 04.06.2022.
//

import SwiftUI

struct ImageButton: View {
    let systemImageName: String
    let onPress: () -> Void
    
    var body: some View {
        Button {
            onPress()
        } label: {
            Image(systemName: systemImageName)
        }
        .buttonStyle(ImageButtonStyle())
    }
}

struct ImageButton_Previews: PreviewProvider {
    static var previews: some View {
        ImageButton(systemImageName: "phone.fill", onPress: {})
    }
}
