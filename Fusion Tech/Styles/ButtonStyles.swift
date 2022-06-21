//
//  ButtonStyles.swift
//  Fusion Tech
//
//  Created by Fusion Tech on 12.12.2021.
//

import SwiftUI

struct FilledButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.headline)
            .frame(minWidth: 0, maxWidth: .infinity)
            .padding(.vertical, 10)
            .background(PRIMARY_COLOR)
            .foregroundColor(.white)
            .clipShape(Capsule())
            .scaleEffect(configuration.isPressed ? 0.9 : 1)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
    }
}

struct OutlinedButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.headline)
            .frame(minWidth: 0, maxWidth: .infinity)
            .padding(.vertical, 10)
            .foregroundColor(PRIMARY_COLOR)
            .overlay(Capsule().stroke(PRIMARY_COLOR, lineWidth: 2))
            .scaleEffect(configuration.isPressed ? 0.9 : 1)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
    }
}

struct ErrorButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.headline)
            .frame(minWidth: 0, maxWidth: .infinity)
            .padding(.vertical, 10)
            .foregroundColor(ERROR_COLOR)
            .overlay(Capsule().stroke(ERROR_COLOR, lineWidth: 2))
            .scaleEffect(configuration.isPressed ? 0.9 : 1)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
    }
}


struct ImageButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(5)
            .foregroundColor(PRIMARY_COLOR)
            .scaleEffect(configuration.isPressed ? 1.1 : 1)
            .animation(.easeInOut(duration: 0.2), value: configuration.isPressed)
    }
}
