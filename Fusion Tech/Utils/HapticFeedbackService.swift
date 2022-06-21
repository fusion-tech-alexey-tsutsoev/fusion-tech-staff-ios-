//
//  HapticFeedbackService.swift
//  Fusion Tech
//
//  Created by Fusion Tech on 19.04.2022.
//

import Foundation
import SwiftUI

public class HapticFeedbackService {
    static func hapticFeedbackOnTap(style: UIImpactFeedbackGenerator.FeedbackStyle = .light) {
        let impact = UIImpactFeedbackGenerator(style: style)
        impact.impactOccurred()
    }
}
