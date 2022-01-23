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
            AsyncImage(url: URL(string: avatar)) { image in
                image
                    .resizable()
                    .scaledToFill()
            } placeholder: {
                ProgressView().progressViewStyle(CircularProgressViewStyle(tint: PRIMARY_COLOR))
            }
            .frame(width: size, height: size)
            .background(NAV_BACKGROUND)
            .clipShape(Circle())
        } else {
            Image(systemName:  "person.circle.fill")
                .frame(width: size, height: size)
                .clipShape(Circle())
        }
    }
}

struct CustomAsyncImageView_Previews: PreviewProvider {
    static var previews: some View {
        CustomAsyncImageView(avatar: "", size: 100)
    }
}
