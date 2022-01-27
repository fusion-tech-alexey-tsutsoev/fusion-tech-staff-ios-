//
//  ArticleListView.swift
//  Fusion Tech
//
//  Created by Fusion Tech on 24.01.2022.
//

import SwiftUI

struct ArticleListView: View {
    @ObservedObject var articlesVM = ArticlesViewModel()
    
    private var columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        VStack {
            VStack {
                Button {
                    withAnimation {
                        articlesVM.isShowFilters.toggle()
                    }
                } label: {
                    HStack {
                        Text("Показать фильтры")
                        
                        Image(systemName: "chevron.down")
                            .rotationEffect(.degrees(articlesVM.isShowFilters ? 180 : 0))
                    }
                    .padding()
                }
                
                if articlesVM.isShowFilters {
                    Text("Пока тут пусто")
                }
            }
            .padding()
            
            if articlesVM.isLoading {
                SplashView(size: 50)
                    .padding(.vertical, 20)
            }
            
            LazyVGrid(columns: columns, alignment: .center, spacing: 10) {
                ForEach(articlesVM.articles) { article in
                    ArticleCardView(article: article, allTags: articlesVM.tags)
                }
            }
        }
        .onAppear {
            loadArticlesAndTags()
        }
        .toolbar {
            Button {
                articlesVM.isSHowSheet.toggle()
            } label: {
                Image(systemName: "plus.circle.fill")
            }
        }
        .sheet(isPresented: $articlesVM.isSHowSheet) {
            CreateArticleSheetView(tags: articlesVM.tags)
        }
    }
    
    // MARK: - Helpers
    private func loadArticlesAndTags() {
        articlesVM.isLoading = true
        DispatchQueue.main.async {
            // MARK: - get article
            ArticleService.shared.getAllArticles { result in
                switch result {
                case .failure(let err):
                    articlesVM.error = err.errorDescriprion
                case .success(let articles):
                    articlesVM.articles = articles
                }
            }
            
            // MARK: - get tags
            ArticleService.shared.getTags { resultTag in
                switch resultTag {
                case .success(let tags):
                    articlesVM.tags = tags
                case .failure(let err):
                    articlesVM.error = err.errorDescriprion
                }
            }
            articlesVM.isLoading = false
        }
    }
}

struct ArticleListView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleListView()
    }
}
