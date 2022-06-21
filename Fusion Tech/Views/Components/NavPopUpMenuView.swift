//
//  NavPopUpMenuView.swift
//  Fusion Tech
//
//  Created by Fusion Tech on 10.04.2022.
//

import SwiftUI

struct NavPopUpMenuView: View {
    @EnvironmentObject var store: Store
    let isPresent: Bool
    
    private let requests = RequstEnum.allCases
    private let animationDelay = 0.1
    
    var body: some View {
        VStack {
            ForEach(0 ..< requests.count, id: \.self) { index in
                NavigationLink {
                    RequestFormView(requestVM: RequestViewModel(initialType: requests[index], store: store))
                } label: {
                    Text(requests[index].value)
                        .foregroundColor(.white)
                        .padding(10)
                        .background(PRIMARY_COLOR)
                        .clipShape(Capsule())
                }
                .padding(.bottom, 20)
                .opacity(isPresent ? 1 : 0)
                .animation(.easeOut(duration: 0.1).delay(animationDelay * Double(requests.count - index)), value: isPresent)
            }
        }
        .padding(.bottom, 20)
    }
}
