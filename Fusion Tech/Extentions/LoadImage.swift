//
//  LoadImage.swift
//  Fusion Tech
//
//  Created by Fusion Tech on 20.12.2021.
//

import Foundation
import SwiftUI


extension String {
    // MARK: - load remote image by URL
    func load() -> UIImage {
        do {
            if let url = URL(string: self) {
                let data = try Data(contentsOf: url)
                return UIImage(data: data) ?? UIImage()
            }
        } catch {
            print("Error: \(error)")
        }
        return UIImage()
    }
}
