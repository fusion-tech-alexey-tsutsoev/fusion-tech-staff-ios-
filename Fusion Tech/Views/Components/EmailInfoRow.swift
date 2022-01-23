//
//  EmailInfoRow.swift
//  Fusion Tech
//
//  Created by Fusion Tech on 23.01.2022.
//

import SwiftUI

struct EmailInfoRow: View {
    let email: String
    var body: some View {
        HStack(alignment: .center, spacing: 10) {
            InfoRowView(title: "Email", info: email)
            
            Button {
                openLink(link: "mailto:\(email)")
            } label: {
                Image(systemName: "mail.fill").foregroundColor(PRIMARY_COLOR)
            }
        }
    }
}
