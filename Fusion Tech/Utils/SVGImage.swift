//
//  SVGImage.swift
//  Fusion Tech
//
//  Created by Fusion Tech on 16.12.2021.
//

import Foundation
import SwiftUI
import Macaw

// TODO: - Need to fix
struct SVGImage: UIViewRepresentable {
    var name: String

    func makeUIView(context: Context) -> SVGView {
        let svgView = SVGView()
        svgView.fileName = self.name
        return svgView
    }

    func updateUIView(_ uiView: SVGView, context: Context) {
      uiView.fileName = name
    }
}
