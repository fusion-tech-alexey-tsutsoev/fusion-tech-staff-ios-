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
    case userUpdate
    case me
    case refresh
    case request
    case tasks
    case articles
    case tags
    
    // MARK: - SERVER LINK
    private var baseURL: String {
        return "https://staff.demo.fusion-tech.pro/api/v2" // demo API
//        return "https://staff.fusion-tech.pro/api/v2" // Prod API
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
        case .userUpdate:
            return self.baseURL + "/user/update"
        case .request:
            return self.baseURL + "/request"
        case .refresh:
            return self.baseURL + "/auth/refresh"
        case .signUp:
            return self.baseURL + "/auth/sign-up"
        case .tasks:
            return self.baseURL + "/diagram/tasks"
        case .articles:
            return self.baseURL + "/articles"
        case .tags:
            return self.baseURL + "/tag"
        }
    }
}
