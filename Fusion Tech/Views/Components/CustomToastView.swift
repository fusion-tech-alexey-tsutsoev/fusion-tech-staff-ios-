//
//  CustomToastView.swift
//  Fusion Tech
//
//  Created by Fusion Tech on 10.01.2022.
//

import SwiftUI

struct CustomToastView: View {
    let type: ToastEnum
    let title: String
    var body: some View {
        Text(title)
            .padding(.vertical, 10)
            .frame(minWidth: 0, maxWidth: .infinity)
            .background(getColorByType())
            .cornerRadius(CORNER_RADUIS)
            .padding()
    }
    
    private func getColorByType() -> Color {
        switch type {
        case .error:
            return ERROR_COLOR
        case .success:
            return Color(uiColor: .systemGreen)
        }
    }
}

struct CustomToastView_Previews: PreviewProvider {
    static var previews: some View {
        CustomToastView(type: .success, title: "Test")
    }
}
