//
//  RequestService.swift
//  Fusion Tech
//
//  Created by Fusion Tech on 28.12.2021.
//

import Foundation
import Alamofire

// MARK: - Request Service
class RequestService {
    // MARK: - Signleton
    static let shared = RequestService()
    
    // MARK: - Send new request
    func postNewRequest(data: Request, complition: @escaping (Result<Void, ApiError>) -> Void) {
        SessionManager.shared.sessionManager
            .request(ApiManager.request.path, method: .post, parameters: data)
            .validate()
            .response { response in
                print(response.response ?? "No response")
                print(response.response?.statusCode ?? "no response")
            }
    }
    
    // MARK: - Get user request
    func getUserRequest(userID: Int, complition: @escaping (Result<[RequestInfo], ApiError>) -> Void) {
        let parameters: Parameters = ["filter": ["user_id": userID]]
        
        SessionManager.shared.sessionManager
            .request(ApiManager.request.path, method: .get, parameters: parameters, encoding: URLEncoding.queryString)
            .validate()
            .responseDecodable(of: RequestResponseData.self) { response in
                guard let requests = response.value?.data else {
                    complition(.failure(.badResponse))
                    return
                }
                complition(.success(requests))
            }
    }
}
