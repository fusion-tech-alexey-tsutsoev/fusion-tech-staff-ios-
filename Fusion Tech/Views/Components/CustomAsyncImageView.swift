//
//  CustomAsyncImageView.swift
//  Fusion Tech
//
//  Created by Fusion Tech on 22.12.2021.
//

import SwiftUI

// MARK: - UI Image from URL
struct CustomAsyncImageView: View {
    let avatar: String?
    let size: CGFloat
    
    var body: some View {
        if let url = avatar {
            AsyncImage(url: URL(string: url)) { image in
                image
                    .resizable()
                    .scaledToFill()
            } placeholder: {
                ProgressView().progressViewStyle(CircularProgressViewStyle(tint: PRIMARY_COLOR))
            }
            .frame(width: size, height: size)
            .background(NAV_BACKGROUND)
            .cornerRadius(50)
        } else {
            Image(systemName:  "person.circle.fill")
                .frame(width: size, height: size)
                .cornerRadius(50)
        }
    }
}

struct CustomAsyncImageView_Previews: PreviewProvider {
    static var previews: some View {
        CustomAsyncImageView(avatar: "", size: 100)
    }
}
