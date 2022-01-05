//
//  UserService.swift
//  Fusion Tech
//
//  Created by Fusion Tech on 14.12.2021.
//

import Foundation
import Alamofire

// MARK: - UserService
class UserService {
    // MARK: - Singleton
    static let shared = UserService()
    
    // MARK: - login
    func login(email: String, password: String, complition: @escaping (Result<Account, ApiError>) -> Void) {
        let login = LoginCreds(username: email, password: password)
        SessionManager.shared.sessionManager
            .request(ApiManager.signIn.path, method: .post, parameters: login, encoder: JSONParameterEncoder.default)
            .validate()
            .responseDecodable(of: Account.self) { response in
                guard let account = response.value else {
                    complition(.failure(.invalidCred))
                    return
                }
                complition(.success(account))
            }
    }
    
    // MARK: - Authorize
    func checkUser(complition: @escaping (Result<User, ApiError>) -> Void) {
        SessionManager.shared.sessionManager
            .request(ApiManager.me.path)
            .validate()
            .responseDecodable(of: User.self) { response in
                guard let user = response.value else {
                    complition(.failure(.invalidCred))
                    return
                }
                complition(.success(user))
            }
    }
}
