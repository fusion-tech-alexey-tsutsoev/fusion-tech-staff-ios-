//
//  TokenService.swift
//  Fusion Tech
//
//  Created by Fusion Tech on 15.12.2021.
//

import Foundation

// TODO: - replace UserDefaults to KeyChain

public class TokenService {
    // MARK: - User Defaults
    static private let standard = UserDefaults.standard
    
    // MARK: - Getters
    static func getAccess() -> String? {
        guard let token = standard.string(forKey: "AccessToken") else {
            return nil
        }
        return token
    }
    
    static func getRefresh() -> String? {
        guard let token = standard.string(forKey: "RefreshToken") else {
            return nil
        }
        return token
    }
    
    // MARK: - Setters
    static func setAccess(token: String) {
        standard.set(token, forKey: "AccessToken")
    }
    
    static func setRefresh(token: String) {
        standard.set(token, forKey: "RefreshToken")
    }
    
    // MARK: - Clear
    static func clearTokens() {
        standard.removeObject(forKey: "AccessToken")
        standard.removeObject(forKey: "RefreshToken")
    }
}
