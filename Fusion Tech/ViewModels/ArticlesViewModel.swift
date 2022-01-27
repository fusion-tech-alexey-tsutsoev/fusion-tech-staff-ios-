//
//  ArticlesVM.swift
//  Fusion Tech
//
//  Created by Fusion Tech on 24.01.2022.
//

import SwiftUI

class ArticlesViewModel: ObservableObject {
    @Published var isLoading = false
    @Published var articles: ArticleResponse = []
    @Published var tags: TagResponse = []
    @Published var error: String?
    
    @Published var isShowFilters = false
    @Published var isSHowSheet = false
}
