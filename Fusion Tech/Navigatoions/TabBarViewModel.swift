//
//  SwiftUIView.swift
//  Fusion Tech
//
//  Created by Fusion Tech on 10.04.2022.
//

import SwiftUI

class TabBarViewModel: ObservableObject {
    @Published var selection: Int
    @Published var isShowMenu: Bool
    
    init() {
        print("rerender")
        selection = 0
        isShowMenu = false
    }
    
    func menuToggle() {
        HapticFeedbackService.hapticFeedbackOnTap(style: .heavy)
        withAnimation {
            isShowMenu.toggle()
        }
    }
    
    func setSelection(newSelection: Int) {
        HapticFeedbackService.hapticFeedbackOnTap(style: .medium)
        selection = newSelection
        withAnimation {
            isShowMenu = false
        }
    }
}
