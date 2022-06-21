//
//  CustomButton.swift
//  Fusion Tech
//
//  Created by Fusion Tech on 02.06.2022.
//

import SwiftUI

struct CustomButton: View {
    // MARK: - Fields
    let onPress: () -> Void
    let label: String
    let type: ButtonType
    let isLoading: Bool
    let disabled: Bool
    
    // MARK: - init
    init (
        onPress: @escaping () -> Void,
        label: String,
        isLoading: Bool = false,
        type: ButtonType = .filled,
        disabled: Bool = false
    ) {
        self.onPress = onPress
        self.label = label
        self.isLoading = isLoading
        self.type = type
        self.disabled = disabled
    }
    
    
    // MARK: - Body
    var body: some View {
        let button = Button {
            onPress()
        } label: {
            VStack {
                if isLoading {
                    ProgressView()
                } else {
                    Text(label)
                }
            }
        }
        .disabled(isLoading || disabled)
        .font(.headline)
        .frame(minWidth: 0, maxWidth: .infinity)
        .padding(.vertical, 10)

        switch type {
        // MARK: - Outlined
        case .outlined:
            button.buttonStyle(OutlinedButton())
        
        // MARK: - Filled
        case .filled:
            button.buttonStyle(FilledButton())
            
        // MARK: - Error
        case .error:
            button.buttonStyle(ErrorButton())
        }
    }
}

struct CustomButton_Previews: PreviewProvider {
    static var previews: some View {
        CustomButton(onPress: { }, label: "Test")
    }
}
