//
//  UserInfoView.swift
//  Fusion Tech
//
//  Created by Fusion Tech on 15.12.2021.
//

import SwiftUI
import PagerTabStripView

struct UserInfoView: View {
    // MARK: - States
    @EnvironmentObject var store: Store
    @State private var selectedTab: Int = 0
    @State private var isShowEdit = false
    
    // MARK: - Body
    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            
            PagerTabStripView {
                InfoSectionView(user: store.state.user)
                    .pagerTabItem {
                        TitleNavBarItem(title: "Информация")
                    }
                
                RequestSectionView(userId: store.state.user?.id)
                    .pagerTabItem {
                        TitleNavBarItem(title: "Твои заявки")
                    }
            }
            .pagerTabStripViewStyle(.barButton(indicatorBarHeight: 1, indicatorBarColor: PRIMARY_COLOR, tabItemSpacing: 0, tabItemHeight: 50, placedInToolbar: false))
            
            HStack {
                CustomButton(
                    onPress: { isShowEdit.toggle() },
                    label: "Редактировать",
                    type: .outlined
                )
                
                Spacer(minLength: 10)
                
                CustomButton(
                    onPress: { store.dispatch(action: .logOut) },
                    label: "Выйти",
                    type: .error
                )
            }
            .padding(.vertical, 5)
        }
        .sheet(isPresented: $isShowEdit) {
            EditUserView(dismissSheet: dismissSheet)
        }
        .padding()
        .navigationTitle(Text("\(store.state.user?.firstNameRu ?? "Jhon") \(store.state.user?.lastNameRu ?? "Doe")"))
    }
    
    // MARK: - Helpers
    private func dismissSheet() {
        isShowEdit = false
    }
}
