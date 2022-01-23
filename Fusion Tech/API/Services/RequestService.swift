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
    func postNewRequest(requestData: Request, complition: @escaping (Result<String, ApiError>) -> Void) {
        SessionManager.shared.sessionManager
            .request(ApiManager.request.path, method: .post, parameters: requestData.toJSON(), encoding: JSONEncoding.default)
            .validate()
            .response { response in
                print("this is request---->", response.request?.description ?? "No request")
                print("this is response descript---->", response.response?.description ?? "No description")
                print("this is response status---->", response.response?.statusCode ?? "no status")
                if response.response?.statusCode == 201 {
                    complition(.success("Заявка успешно создана"))
                    return
                }
                complition(.failure(.badResponse))
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
    
    // MARK: - Get tasks for Admin
    func getTasksByApi(complition: @escaping (Result<TaskResponse, ApiError>) -> Void) {
        SessionManager.shared.sessionManager
            .request(ApiManager.tasks.path)
            .validate()
            .responseDecodable(of: TaskResponse.self) { response in
                guard let tasks = response.value else {
                    complition(.failure(.badResponse))
                    return
                }
                complition(.success(tasks))
            }
    }
}
