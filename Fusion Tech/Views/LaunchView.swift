//
//  LaunchView.swift
//  Fusion Tech
//
//  Created by Fusion Tech on 03.06.2022.
//

import SwiftUI

struct LaunchView: View {
    @State var opacity = 0.0
    
    var body: some View {
        ZStack {
            Image("LaunchLogo")
                .resizable()
                .frame(minWidth: 0, maxWidth: .infinity, maxHeight: 39)
                .padding(.horizontal, 30)
        }
        .frame(
            minWidth: 0,
            maxWidth: .infinity,
            minHeight: 0,
            maxHeight: .infinity,
            alignment: .center
        )
        .background(NAV_BACKGROUND)
    }
}

struct LaunchView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchView()
    }
}
