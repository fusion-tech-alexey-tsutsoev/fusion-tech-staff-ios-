//
//  SwiftUIView.swift
//  Fusion Tech
//
//  Created by Fusion Tech on 05.04.2022.
//

import SwiftUI

struct BottomTabItem: View {
    let tab: BottomTab
    @ObservedObject var tabBarVM: TabBarViewModel
    
    var body: some View {
        if (tab.id != -1) {
            VStack {
                Image(systemName: tab.systemIconName)
                    .resizable()
                    .padding(.bottom, 2)
                    .frame(width: 35, height: 35, alignment: .center)
                
                Text(tab.title)
                    .font(.system(size: 10))
                    .multilineTextAlignment(.center)
            }
            .foregroundColor(tab.id == tabBarVM.selection ? PRIMARY_COLOR : .white)
            .onTapGesture {
                
                tabBarVM.setSelection(newSelection: tab.id)
            }
        } else {
            ZStack {
                Circle()
                    .foregroundColor(.white)
                    .frame(width: 52, height: 52)
                    .shadow(radius: 4)
                
                Image(systemName: tab.systemIconName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 50, height: 50)
                    .foregroundColor(PRIMARY_COLOR)
                    .rotationEffect(Angle(degrees: tabBarVM.isShowMenu ? 45 : 0))
            }
            .offset(y: -30)
            .onTapGesture {
                tabBarVM.menuToggle()
            }
        }
    }
}
