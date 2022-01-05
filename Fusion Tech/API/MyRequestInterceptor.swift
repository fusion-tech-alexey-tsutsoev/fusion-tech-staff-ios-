//
//  RequestInterceptor.swift
//  Fusion Tech
//
//  Created by Fusion Tech on 29.12.2021.
//

import Foundation
import Alamofire

// MARK: - Request Interceptor
class MyRequestInterceptor: RequestInterceptor {
    // MARK: - Config
    let retryLimit = 2
    // MARK: - ADAPT
    func adapt(_ urlRequest: URLRequest, for session: Session, completion: @escaping (Result<URLRequest, Error>) -> Void) {
        print("-------ADAPT---------")
        var request = urlRequest
        guard let token = TokenService.getAccess() else {
            print("No access Token")
            completion(.success(request))
            return
        }
        let bearerToken = "Bearer \(token)"
        request.setValue(bearerToken, forHTTPHeaderField: "Authorization")
        completion(.success(request))
    }
    
    // MARK: - RETRY
    public func retry(_ request: Alamofire.Request, for session: Alamofire.Session, dueTo error: Error, completion: @escaping (Alamofire.RetryResult) -> Void) {
        print("--------RETRY-------")
        guard let refresh = TokenService.getRefresh() else {
            print("No refresh Token")
            completion(.doNotRetry)
            return
        }
        if request.retryCount > retryLimit {
            completion(.doNotRetry)
        }
        let parameter = Refresh(token: refresh)
        AF.request(ApiManager.refresh.path, method: .post, parameters: parameter)
            .responseDecodable(of: TokensPair.self) { response in
                guard let tokens = response.value else {
                    completion(.doNotRetry)
                    return
                }
                TokenService.setAccess(token: tokens.access)
                TokenService.setRefresh(token: tokens.refresh)
                completion(.retry)
            }
    }
    
}
