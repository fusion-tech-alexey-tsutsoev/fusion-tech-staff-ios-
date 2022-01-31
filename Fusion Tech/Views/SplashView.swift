//
//  SplashView.swift
//  Fusion Tech
//
//  Created by Fusion Tech on 28.12.2021.
//

import SwiftUI

struct SplashView: View {
    let size: CGFloat
    @State private var isLoading = false
    
    var body: some View {
        Circle()
            .stroke(
                AngularGradient(colors: ARRAY_LOGO_COLORS, center: .center),
                style: StrokeStyle(lineWidth: size/10, lineCap: .round, dash: [size/100, size/5])
            )
            .frame(width: size, height: size, alignment: .center)
            .onAppear(perform: {
                withAnimation(Animation.easeInOut(duration: 2).repeatForever()) {
                    isLoading.toggle()
                }
            })
            .rotationEffect(Angle(degrees: isLoading ? 0 : 360))
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView(size: 100)
    }
}
