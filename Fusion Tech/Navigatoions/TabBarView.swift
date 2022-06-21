//
//  TabBarView.swift
//  Fusion-Staff
//
//  Created by Fusion Tech on 05.11.2021.
//

import SwiftUI

// MARK: Bottom Tab Nav Bar
struct TabBarView: View {
    // MARK: - Enviroment
    @EnvironmentObject var store: Store
    @ObservedObject private var tabBarVM = TabBarViewModel()
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                ZStack(alignment: .bottom) {
                        switch tabBarVM.selection {
                        case 0:
                            MemberListView()
                        case 1:
                            ArticleListView()
                        case 2:
                            Celebrations()
                        case 3:
                            UserInfoView()
                        default:
                            MemberListView()
                        }
                    
                    if (tabBarVM.isShowMenu) {
                        BlurEffect(effect: UIBlurEffect(style: .dark))
                            .ignoresSafeArea()
                            .onTapGesture {
                                tabBarVM.menuToggle()
                            }
                    }
                    
                    NavPopUpMenuView(isPresent: tabBarVM.isShowMenu)
                    
                }
                .toolbar {
                    if store.state.user?.role == "admin" {
                        NavigationLink {
                            AdminNavigation()
                        } label: {
                            Image(systemName: "doc.on.clipboard")
                                .foregroundColor(PRIMARY_COLOR)
                        }

                    }
                }
                
                Divider()
                    .background(PRIMARY_COLOR)
                
                BottomNavBar(tabBarVM: tabBarVM)
            }
        }
    }
}
