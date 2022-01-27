//
//  ArticleService.swift
//  Fusion Tech
//
//  Created by Fusion Tech on 24.01.2022.
//

import Foundation

// MARK: - service for getting Articles and Tags
class ArticleService {
    // MARK: - Singleton
    static let shared = ArticleService()
    
    func getAllArticles(complition: @escaping (Result<ArticleResponse, ApiError>) -> Void) {
        SessionManager.shared.sessionManager
            .request(ApiManager.articles.path)
            .validate()
            .responseDecodable(of: ArticleResponse.self) { response in
                guard let articles = response.value else {
                    complition(.failure(.badResponse))
                    return
                }
                complition(.success(articles))
            }
    }
    
    func getTags(complition: @escaping (Result<TagResponse, ApiError>) -> Void) {
        SessionManager.shared.sessionManager
            .request(ApiManager.tags.path)
            .validate()
            .responseDecodable(of: TagResponse.self) { response in
                guard let tags = response.value else {
                    complition(.failure(.badResponse))
                    return
                }
                
                complition(.success(tags))
            }
    }
}
