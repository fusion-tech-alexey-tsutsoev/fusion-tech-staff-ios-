//
//  CustomAsyncImageView.swift
//  Fusion Tech
//
//  Created by Fusion Tech on 22.12.2021.
//

import SwiftUI

// MARK: - UI Image from URL
struct CustomAsyncImageView: View {
    let avatar: String
    let size: CGFloat
    
    var body: some View {
        AsyncImage(url: URL(string: avatar), transaction: Transaction(animation: .easeIn)) { phase in
            switch phase {
            case .empty:
                VStack {
                    SplashView(size: size / 2)
                }
            case .success(let image):
                image
                    .resizable()
                    .scaledToFill()
            case .failure:
                Image(systemName:  "person.circle.fill")
                    .frame(width: size, height: size)
                    .clipShape(Circle())
            @unknown default:
                Image(systemName:  "person.circle.fill")
                    .frame(width: size, height: size)
                    .clipShape(Circle())
            }
        }
        .frame(width: size, height: size)
        .background(NAV_BACKGROUND)
        .clipShape(Circle())
    }
}
