//
//  LinkHelper.swift
//  Fusion Tech
//
//  Created by Fusion Tech on 23.01.2022.
//

import Foundation
import SwiftUI

func openLink(link: String) {
    guard let url = URL(string: link) else {
        return
    }
    UIApplication.shared.open(url)
}
