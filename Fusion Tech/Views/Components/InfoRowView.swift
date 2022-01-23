//
//  InfoRowView.swift
//  Fusion Tech
//
//  Created by Fusion Tech on 22.12.2021.
//

import SwiftUI

struct InfoRowView: View {
    let title: String
    let info: String
    var body: some View {
        HStack(alignment: .center) {
            Text(title).bold()
            Text(info)
        }
        .foregroundColor(FONT_COLOR)
    }
}

struct InfoRowView_Previews: PreviewProvider {
    static var previews: some View {
        InfoRowView(title: "Login", info: "Alex")
    }
}
