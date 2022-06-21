//
//  CustomToastView.swift
//  Fusion Tech
//
//  Created by Fusion Tech on 10.01.2022.
//

import SwiftUI

struct CustomToastView: View {
    // MARK: - State
    @EnvironmentObject var store: Store
    @State private var offset = -500.0
    let isPresent: Bool
    
    // MARK: - Helpers
    private func getColorByType() -> Color {
        switch store.state.toast?.type {
        case .error:
            return ERROR_COLOR
        case .success:
            return Color(uiColor: .systemGreen)
        default:
            return .blue
        }
    }
    
    private func getImageByType() -> String {
        switch store.state.toast?.type {
        case .error:
            return "xmark.circle"
        case .success:
            return "checkmark.circle"
        default:
            return "info.circle"
        }
    }
    
    // MARK: - Layout
    var body: some View {
        if isPresent {
            HStack {
                Image(systemName: getImageByType())
                    .resizable()
                    .frame(width: 32.0, height: 32.0)
                    .foregroundColor(getColorByType())
                Text(store.state.toast?.message ?? "Ошибка")
            }
            .padding()
            .frame(minWidth: 0, maxWidth: .infinity)
            .background(NAV_BACKGROUND)
            .clipShape(Capsule())
            .padding()
            .transition(.asymmetric(insertion: .slide, removal: .opacity))
            .position(x: UIScreen.screenWidth / 2 ,y: 50)
        }
    }
}

struct CustomToastView_Previews: PreviewProvider {
    static var previews: some View {
        CustomToastView(isPresent: true)
    }
}
