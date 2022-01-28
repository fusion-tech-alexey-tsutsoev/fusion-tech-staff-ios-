//
//  CreateArticleSheetView.swift
//  Fusion Tech
//
//  Created by Fusion Tech on 25.01.2022.
//

import SwiftUI
import FloatingLabelTextFieldSwiftUI
import Alamofire

struct CreateArticleSheetView: View {
    let tags: [TagInfo]
    let createArticle: () -> Void
    
    @Binding var link: String
    @Binding var selectedTags: [Int]
    
    var body: some View {
        VStack {
            FloatingLabelTextField($link, placeholder: "Ссылка")
                .addValidation(.init(condition: link.match(pattern: URL_REGEX), errorMessage: "Invalid Link"))
                .isShowError(true)
                .floatingBaseStyle()
                .textInputAutocapitalization(.never)
                .keyboardType(.URL)
                .padding(.bottom, 20)
            
            List {
                Section("Теги") {
                    ForEach(tags) { tag in
                        let isSelected = containInSelected(tag: tag)
                        
                        Button {
                            tagAction(tag: tag, isSelected: isSelected)
                        } label: {
                            HStack {
                                Text(tag.title)
                                
                                Spacer()
                                
                                if isSelected {
                                    Image(systemName: "checkmark.circle.fill")
                                }
                            }
                        }
                        .foregroundColor(PRIMARY_COLOR)
                    }
                }
            }
            Button {
                print("tet")
                createArticle()
            } label: {
                Text("Отправить")
            }
            .getFilled(isDisabled: link.isEmpty)

        }
        .padding()
    }
    
    // MARK: - Helpers
    func containInSelected(tag: TagInfo) -> Bool {
        return selectedTags.contains(where: { selected in selected == tag.id })
    }
    
    func tagAction(tag: TagInfo, isSelected: Bool) {
        withAnimation {
            if isSelected {
                selectedTags.removeAll(where: { selected in selected == tag.id })
            } else {
                selectedTags.append(tag.id)
            }
        }
    }
}
