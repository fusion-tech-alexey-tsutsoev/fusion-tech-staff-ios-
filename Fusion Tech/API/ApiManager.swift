//
//  ApiManager.swift
//  Fusion Tech
//
//  Created by Fusion Tech on 14.12.2021.
//

import Foundation
import Alamofire

// MARK: - API manager
enum ApiManager {
    case signIn
    case signUp
    case user
    case me
    case refresh
    case request
    
    // MARK: - SERVER LINK
    private var baseURL: String {
        return "https://staff.fusion-tech.pro/api/v2"
    }
    
    // MARK: - PATH
    var path: String{
        switch self {
        case .signIn:
            return self.baseURL + "/auth/sign-in"
        case .me:
            return self.baseURL + "/auth/me"
        case .user:
            return self.baseURL + "/user"
        case .request:
            return self.baseURL + "/request"
        case .refresh:
            return self.baseURL + "/auth/refresh"
        default:
            return self.baseURL
        }
    }
}
