//
//  UserInfoView.swift
//  Fusion Tech
//
//  Created by Fusion Tech on 15.12.2021.
//

import SwiftUI

struct UserInfoView: View {
    // MARK: - States
    @EnvironmentObject var store: Store
    @State private var selectedTab: Int = 0
    
    // MARK: - Body
    var body: some View {
        NavigationView {
            VStack {
                Picker("", selection: $selectedTab) {
                    Text("Информация").tag(0)
                    Text("Мои заявки").tag(1)
                }
                .pickerStyle(SegmentedPickerStyle())
                
                switch selectedTab {
                case 0:
                    InfoSectionView(
                        avatar: store.state.user?.avatar ?? "",
                        login: store.state.user?.login ?? "Jhon Doe",
                        slackLogin: store.state.user?.slackName ?? "Jhon Doe",
                        phone: store.state.user?.phone ?? "8 800 555 35 35",
                        dob: store.state.user?.doB ?? ""
                    )
                case 1:
                    if let userId = store.state.user?.id {
                        RequestSectionView(userId: userId)
                    } else {
                        Text("Problem with User ID")
                    }
                default:
                    Text("Something went wrong")
                }
                
                Spacer()
                
                Button {
                    store.dispatch(action: .logOut)
                } label: {
                    Text("Выйти").foregroundColor(ERROR_COLOR)
                }
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
            .padding(.vertical)
            .navigationTitle("\(store.state.user?.firstNameRu ?? "Jhon") \(store.state.user?.lastNameRu ?? "Doe")")
        }
    }
}

struct UserInfoView_Previews: PreviewProvider {
    static var previews: some View {
        UserInfoView()
    }
}
