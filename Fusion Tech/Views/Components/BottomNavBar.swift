//
//  BottomNavBar.swift
//  Fusion Tech
//
//  Created by Fusion Tech on 05.04.2022.
//

import SwiftUI

struct BottomNavBar: View {
    @ObservedObject var tabBarVM: TabBarViewModel
    
    var body: some View {
        HStack (alignment: .center) {
            ForEach(BOTTOM_TABS) { tab in
                Spacer()
                BottomTabItem(tab: tab, tabBarVM: tabBarVM)
                Spacer()
            }
        }
        .padding(5)
        .background(NAV_BACKGROUND)
    }
}
