//
//  Regex.swift
//  Fusion Tech
//
//  Created by Fusion Tech on 25.01.2022.
//

import Foundation

extension String {
    func match(pattern: String) -> Bool {
        let regex = try? NSRegularExpression(pattern: pattern)
        let range = NSRange(location: 0, length: self.utf16.count)
        return regex?.firstMatch(in: self, options: [], range: range) != nil
    }
}
