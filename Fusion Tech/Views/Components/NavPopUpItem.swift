//
//  NavPopUpItem.swift
//  Fusion Tech
//
//  Created by Fusion Tech on 10.04.2022.
//

import SwiftUI

struct NavPopUpItem: View {
    var body: some View {
        VStack(alignment: .center, spacing: 5) {
            Image(systemName: "plus.circle.fill")
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        }
    }
}

struct NavPopUpItem_Previews: PreviewProvider {
    static var previews: some View {
        NavPopUpItem()
    }
}
