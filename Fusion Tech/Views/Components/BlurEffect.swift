//
//  BlurEffect.swift
//  Fusion Tech
//
//  Created by Fusion Tech on 10.04.2022.
//

import Foundation
import SwiftUI

struct BlurEffect: UIViewRepresentable {
    var effect: UIVisualEffect?
    func makeUIView(context: UIViewRepresentableContext<Self>) -> UIVisualEffectView { UIVisualEffectView() }
    func updateUIView(_ uiView: UIVisualEffectView, context: UIViewRepresentableContext<Self>) { uiView.effect = effect }
}
