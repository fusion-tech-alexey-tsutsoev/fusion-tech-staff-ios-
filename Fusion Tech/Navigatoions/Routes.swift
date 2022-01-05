//
//  routes.swift
//  Fusion-Staff
//
//  Created by Fusion Tech on 05.11.2021.
//

import Foundation
import SwiftUI

class Route: Identifiable {
    let id = UUID()
    let index: Int
    let icon: String
    
    init (index: Int, iconName: String) {
        self.index = index
        self.icon = iconName
    }
}


let navigationRoutes = [
    Route(index: 0, iconName: "person.fill"),
    Route(index: 1, iconName: "plus.circle"),
    Route(index: 2, iconName: "slider.horizontal.3")
]
