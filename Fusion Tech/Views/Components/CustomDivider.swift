//
//  CustomDivider.swift
//  Fusion Tech
//
//  Created by Fusion Tech on 13.01.2022.
//

import SwiftUI

struct CustomDivider: View {
    var body: some View {
        Divider()
            .background(PRIMARY_COLOR)
            .padding(.vertical)
    }
}

struct CustomDivider_Previews: PreviewProvider {
    static var previews: some View {
        CustomDivider()
    }
}
