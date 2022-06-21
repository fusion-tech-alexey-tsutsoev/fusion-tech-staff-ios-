//
//  ArticleListView.swift
//  Fusion Tech
//
//  Created by Fusion Tech on 24.01.2022.
//

import SwiftUI
import ExytePopupView

struct ArticleListView: View {
    @EnvironmentObject var store: Store
    @ObservedObject var articlesVM = ArticlesViewModel()
    
    private var columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        VStack {
            VStack {
                Button {
                    animatedFiltersToggle()
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
            ZStack(alignment: .bottomTrailing) {
                ScrollView {
                    LazyVGrid(columns: columns, alignment: .center, spacing: 10) {
                        ForEach(articlesVM.articles) { article in
                            ArticleCardView(article: article, allTags: articlesVM.tags)
                        }
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .padding(.bottom, 50)
                }
                
                Button {
                    articlesVM.isSHowSheet.toggle()
                } label: {
                    Image(systemName: "plus.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .foregroundStyle(.white, PRIMARY_COLOR)
                        .frame(width: 50, height: 50)
                }
                .position(
                    x: UIScreen.screenWidth - 40,
                    y:  UIScreen.screenHeight - 400
                )
            }
        }
        .onAppear {
            loadArticlesAndTags()
        }
        .sheet(isPresented: $articlesVM.isSHowSheet) {
            CreateArticleSheetView(
                tags: articlesVM.tags,
                createArticle: createArticle,
                link: $articlesVM.postLink,
                selectedTags: $articlesVM.selectedTags
            )
        }
        .popup(
            isPresented: $articlesVM.isShowToast,
            type: .floater(verticalPadding: 120),
            position: .bottom, autohideIn: 5,
            closeOnTapOutside: true,
            dismissCallback: {
            articlesVM.error = nil
        }) {
            // TODO: - improve
//            CustomToastView()
        }
        .navigationTitle("Статьи")
    }
    
    // MARK: - Helpers
    private func createArticle() {
        articlesVM.isSHowSheet.toggle()
        DispatchQueue.main.async {
            ArticleService.shared.postArticle(aarticle: ArticlePayload(link: articlesVM.postLink, tags: articlesVM.selectedTags)) { result in
                print("in result")
                switch result {
                case .failure(let err):
                    articlesVM.setError(err: err)
                case .success(let message):
                    print("good")
                    store.dispatch(action: .setToast(toast: ToastState(message: message, type: .success), isShow: true))
                }
            }
        }
    }
    
    private func animatedFiltersToggle() {
        withAnimation {
            articlesVM.isShowFilters.toggle()
        }
    }
    
    private func loadArticlesAndTags() {
        articlesVM.isLoading = true
        DispatchQueue.main.async {
//             MARK: - get article
            ArticleService.shared.getAllArticles { result in
                switch result {
                case .failure(let err):
                    articlesVM.setError(err: err)
                case .success(let articles):
                    articlesVM.articles = articles
                }
            }
            
            // MARK: - get tags
//            ArticleService.shared.getTags { resultTag in
//                switch resultTag {
//                case .success(let tags):
//                    articlesVM.tags = tags
//                case .failure(let err):
//                    articlesVM.error = err.errorDescriprion
//                }
//            }
            articlesVM.isLoading = false
        }
    }
}
