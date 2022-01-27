//
//  ArticleCardView.swift
//  Fusion Tech
//
//  Created by Fusion Tech on 24.01.2022.
//

import SwiftUI
import Alamofire

struct ArticleCardView: View {
    let article: Article
    let allTags: [TagInfo]
    let tagColumns: [GridItem] = [GridItem(.flexible()), GridItem(.flexible())]
    var body: some View {
        ZStack {
            if !article.image.isEmpty {
                AsyncImage(url: URL(string: article.image)) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle(tint: PRIMARY_COLOR))
                    case .success(let image):
                        image
                            .resizable()
                            .scaledToFit()
                    case .failure:
                        Image(systemName: "newspaper")
                            .resizable()
                            .scaledToFit()
                            .foregroundColor(SECUNDARY_COLOR)
                    @unknown default:
                        EmptyView()
                    }
                }
            }
            
            Color(MAIN_UI_BACKGROUND)
                .opacity(0.5)
            
            VStack(alignment: .leading) {
                Text(article.title).bold().foregroundColor(FONT_COLOR).lineLimit(nil)
                
                Text(article.bodyDescription).foregroundColor(FONT_COLOR).lineLimit(4)
                
                LazyVGrid(columns: tagColumns, spacing: 5) {
                    ForEach(getTagTitles(), id: \.self) { title in
                        Capsule()
                            .fill(PRIMARY_COLOR)
                            .frame(height: 30, alignment: .center)
                            .overlay(Text(title).foregroundColor(.white))
                    }
                }
            }
            .padding()
        }
        .onTapGesture {
            openLink(link: article.link)
        }
        .contextMenu {
            Button {
                print("test")
            } label: {
                Label("Удалить", systemImage: "trash.circle.fill")
            }
        }
    }
    
    // MARK: Helpers
    private func getTagTitles() -> [String] {
        article.tags.map { tag in
            allTags.first { tagInfo in
                tagInfo.id == tag.id
            }?.title ?? "#"
        }
    }
}
