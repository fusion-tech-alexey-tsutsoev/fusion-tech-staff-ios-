//
//  ArticlesVM.swift
//  Fusion Tech
//
//  Created by Fusion Tech on 24.01.2022.
//

import SwiftUI

// MARK: - model for article list
class ArticlesViewModel: ObservableObject {
    // MARK: - renders info
    @Published var articles: ArticleResponse = []
    @Published var tags: TagResponse = []
    @Published var error: String?
    
    // MARK: - flags
    @Published var isLoading = false
    @Published var isShowFilters = false
    @Published var isSHowSheet = false
    
    // MARK: model for create
    @Published var postLink: String = ""
    @Published var selectedTags: [Int] = []
}
