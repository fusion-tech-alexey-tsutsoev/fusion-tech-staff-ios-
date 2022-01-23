//
//  FloatingBaseStyle.swift
//  Fusion Tech
//
//  Created by Fusion Tech on 12.12.2021.
//

import SwiftUI
import FloatingLabelTextFieldSwiftUI

// MARK: - Styles for text fields
extension FloatingLabelTextField {
    // MARK: - Base style
    func floatingBaseStyle() -> some View {
        self
            .textColor(FONT_COLOR)
            .lineColor(FONT_COLOR)
            .errorColor(ERROR_COLOR)
            .selectedLineColor(PRIMARY_COLOR)
            .selectedTextColor(PRIMARY_COLOR)
            .selectedTitleColor(PRIMARY_COLOR)
            .frame(height: 70)
    }
    
    // MARK: - get search bar
    func getSearchBarStyle() -> some View {
        self
            .rightView({
                Image(systemName: "magnifyingglass.circle.fill")
            })
            .floatingBaseStyle()
            .disableAutocorrection(true)
            .textInputAutocapitalization(.never)
            .foregroundColor(PRIMARY_COLOR)
    }
    
    // MARK: - Password style
    func passwordView(isSecure: Binding<Bool>) -> some View {
        return self
            .isSecureTextEntry(!isSecure.wrappedValue)
            .rightView({
                Button(action: {
                    withAnimation {
                        isSecure.wrappedValue.toggle()
                    }
                }, label: {
                    Image(systemName: isSecure.wrappedValue ? "eye.slash" : "eye").foregroundColor(PRIMARY_COLOR)
                })
            })
            .textColor(FONT_COLOR)
            .lineColor(FONT_COLOR)
            .errorColor(ERROR_COLOR)
            .selectedLineColor(PRIMARY_COLOR)
            .selectedTextColor(PRIMARY_COLOR)
            .selectedTitleColor(PRIMARY_COLOR)
            .frame(height: 70)
    }
}
