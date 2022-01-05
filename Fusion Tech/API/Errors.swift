//
//  ERRORS.swift
//  Fusion Tech
//
//  Created by Fusion Tech on 14.12.2021.
//

import Foundation

// MARK: - Custom Error
enum ApiError: Error {
    case invalidCred
    case badResponse
    
    var id: String {
        self.localizedDescription
    }
    
    var errorDescriprion: String? {
        switch self {
        case .invalidCred:
            return NSLocalizedString("Email or Password not coorect. Please try again", comment: "Test")
        case .badResponse:
            return NSLocalizedString("Bad Response from server", comment: "Test")
        }
    }
}
