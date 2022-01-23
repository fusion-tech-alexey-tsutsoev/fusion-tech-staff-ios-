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
    
    // MARK: - sign up
    func signUp(data: SignUpParameters, complition: @escaping (Result<String, ApiError>) -> Void) {
        SessionManager.shared.sessionManager
            .request(ApiManager.signUp.path, method: .post, parameters: data, encoder: JSONParameterEncoder.default)
            .validate()
            .response { response in
                if response.response?.statusCode == 201 {
                    complition(.success("Вы зарегестрированы! Ожидайте подтверждения заявки"))
                    return
                }
                complition(.failure(.badResponse))
            }
    }
    
    // MARK: - update user info
    func updateUserInfo(data: UpdateUserPayload, id: Int, complition: @escaping (Result<User, ApiError>) -> Void) {
        SessionManager.shared.sessionManager
            .request(ApiManager.userUpdate.path + "/\(id)", method: .patch, parameters: data, encoder: JSONParameterEncoder.default)
            .validate()
            .responseDecodable(of: User.self) { response in
                guard let user = response.value else {
                    complition(.failure(.badResponse))
                    return
                }
                complition(.success(user))
            }
    }
    
    // MARK: - get user by ID
    func getUserById(id: Int, complition: @escaping (Result<TeamMember, ApiError>) -> Void) {
        SessionManager.shared.sessionManager
            .request(ApiManager.user.path + "/\(id)")
            .validate()
            .responseDecodable(of: TeamMember.self) { response in
                guard let user = response.value else {
                    complition(.failure(.badResponse))
                    return
                }
                complition(.success(user))
            }
    }
}
