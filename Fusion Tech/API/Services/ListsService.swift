//
//  ListsService.swift
//  Fusion Tech
//
//  Created by Fusion Tech on 20.12.2021.
//

import Foundation
import Alamofire

// MARK: - ListsServices
class ListsServices {
    static let shared = ListsServices()
    
    // MARK: - Get Active User
    func getActiveUser(complition: @escaping (Result<[TeamMember], ApiError>) -> Void) {
        let parameters: Parameters = ["filter": ["status": ["active"]]]
        SessionManager.shared.sessionManager
            .request(ApiManager.user.path, method: .get, parameters: parameters, encoding: URLEncoding.queryString)
            .validate()
            .responseDecodable(of: Team.self) { response in
                guard let users = response.value?.data else {
                    complition(.failure(.badResponse))
                    return
                }
                complition(.success(users))
            }
    }
}
