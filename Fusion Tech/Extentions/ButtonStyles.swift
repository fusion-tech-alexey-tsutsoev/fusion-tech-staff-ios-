//
//  ButtonStyles.swift
//  Fusion Tech
//
//  Created by Fusion Tech on 12.12.2021.
//

import SwiftUI

extension Button {
    // MARK: - FILLED
    func getFilled(isDisabled: Bool) -> some View {
        self
            .font(.headline)
            .frame(minWidth: 0, maxWidth: .infinity)
            .padding(.vertical, PADDING_SIZE)
            .background(PRIMARY_COLOR)
            .cornerRadius(CORNER_RADUIS)
            .foregroundColor(isDisabled ? FONT_COLOR : .white)
            .disabled(isDisabled)

    }
    
    // MARK: - OUTLINED
    func getOutLined() -> some View {
        self
            .padding(.vertical, PADDING_SIZE)
            .frame(minWidth: 0, maxWidth: .infinity)
            .overlay(RoundedRectangle(cornerRadius: CORNER_RADUIS)
            .stroke(PRIMARY_COLOR, lineWidth: 1))
            .foregroundColor(PRIMARY_COLOR)
            .font(.headline)
    }
    
    // MARK: - TEXT
    func getEmpty() -> some View {
        self
            .font(.headline)
            .foregroundColor(PRIMARY_COLOR)
    }
}
