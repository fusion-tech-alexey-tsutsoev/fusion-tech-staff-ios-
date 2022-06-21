//
//  TitleNavBarItem.swift
//  Fusion Tech
//
//  Created by Fusion Tech on 03.04.2022.
//

import SwiftUI

struct TitleNavBarItem: View {
    let title: String

    var body: some View {
        VStack {
            Text(title)
                .foregroundColor(PRIMARY_COLOR)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
