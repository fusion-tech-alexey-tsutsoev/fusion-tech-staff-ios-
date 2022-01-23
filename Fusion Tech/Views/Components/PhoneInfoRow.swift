//
//  InfoRowWithBtn.swift
//  Fusion Tech
//
//  Created by Fusion Tech on 23.01.2022.
//

import SwiftUI

struct PhoneInfoRow: View {
    let phone: String
    var body: some View {
        HStack(alignment: .center, spacing: 10) {
            InfoRowView(title: "Телефон", info: phone)
            
            Button {
                openLink(link: "tel://\(phone)")
            } label: {
                Image(systemName: "phone.fill").foregroundColor(PRIMARY_COLOR)
            }
        }
    }
}
