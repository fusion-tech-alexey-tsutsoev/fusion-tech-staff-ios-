//
//  SessionManager.swift
//  Fusion Tech
//
//  Created by Fusion Tech on 30.12.2021.
//

import Foundation
import Alamofire

// MARK: Request configuration
class SessionManager {
    static let shared = SessionManager()
    
    let sessionManager: Session = {
        let configuration = URLSessionConfiguration.af.default
        configuration.timeoutIntervalForRequest = 30
        configuration.waitsForConnectivity = true
        return Session(
            configuration: configuration,
            interceptor: MyRequestInterceptor()
        )
    }()
}
