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
        if !avatar.isEmpty {
            AsyncImage(url: URL(string: avatar)) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: PRIMARY_COLOR))
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
}
