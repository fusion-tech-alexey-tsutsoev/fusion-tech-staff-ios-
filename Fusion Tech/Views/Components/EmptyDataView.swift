//
//  EmptyDataView.swift
//  Fusion Tech
//
//  Created by Fusion Tech on 23.01.2022.
//

import SwiftUI

struct EmptyDataView: View {
    let title: String
    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            Image(systemName: "x.circle")
                .resizable()
                .frame(width: 100, height: 100, alignment: .center)
            
            Text(title)
                .bold()
                .font(.largeTitle)
                .multilineTextAlignment(.center)
        }
        .padding(.vertical, 100)
    }
}

struct EmptyDataView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyDataView(title: "TEST")
    }
}
