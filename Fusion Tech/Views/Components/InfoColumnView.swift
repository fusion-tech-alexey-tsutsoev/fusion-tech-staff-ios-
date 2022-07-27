//
//  InfoColumnView.swift
//  Fusion Tech
//
//  Created by Fusion Tech on 03.07.2022.
//

import SwiftUI

struct InfoColumnView: View {
    let title: String
    let info: String
    let isLink: Bool
    
    init(title: String, info: String, isLink: Bool = false) {
        self.title = title
        self.info = info
        self.isLink = isLink
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            ThemedText(text: title, weight: .bold)
            ThemedText(text: info, weight: .light, color: isLink ? PRIMARY_COLOR : FONT_COLOR)
        }
    }
}

struct InfoColumnView_Previews: PreviewProvider {
    static var previews: some View {
        InfoColumnView(title: "Test", info: "Test32432432432432432", isLink: true)
    }
}
