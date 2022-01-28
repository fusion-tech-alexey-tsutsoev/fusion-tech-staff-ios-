//
//  TokenService.swift
//  Fusion Tech
//
//  Created by Fusion Tech on 15.12.2021.
//

import Foundation
import KeychainSwift

public class TokenService {
    // MARK: - Init Key Chain
    static private let keyChain = KeychainSwift()
    
    // MARK: - Getters
    static func getAccess() -> String? {
        return keyChain.get("AccessToken")
    }
    
    static func getRefresh() -> String? {
        return keyChain.get("RefreshToken")
    }
    
    // MARK: - Setters
    static func setAccess(token: String) {
        keyChain.set(token, forKey: "AccessToken")
    }
    
    static func setRefresh(token: String) {
        keyChain.set(token, forKey: "RefreshToken")
    }
    
    // MARK: - Clear
    static func clearTokens() {
        keyChain.delete("AccessToken")
        keyChain.delete("RefreshToken")
    }
}
