//
//  ArticleService.swift
//  Fusion Tech
//
//  Created by Fusion Tech on 24.01.2022.
//

import Foundation
import Alamofire

// MARK: - service for work with Articles
class ArticleService {
    // MARK: - Singleton
    static let shared = ArticleService()
    
    //MARK: - get articles
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
    
    // MARK: - get all Tags
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
    
    //MARK: - post new article
    func postArticle(aarticle: ArticlePayload, complition: @escaping (Result<String, ApiError>) -> Void) {
        SessionManager.shared.sessionManager
            .request(ApiManager.articles.path, method: .post, parameters: aarticle, encoder: JSONParameterEncoder.default)
            .validate()
            .response { response in
                if response.response?.statusCode == 201 {
                    complition(.success("Статья успешно создана"))
                    return
                }
                complition(.failure(.badResponse))
            }
    }
}
