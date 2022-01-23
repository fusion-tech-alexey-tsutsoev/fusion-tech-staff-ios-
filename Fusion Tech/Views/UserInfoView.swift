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
    @State private var isShowEdit = false
    
    // MARK: - Body
    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
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
                                dob: store.state.user?.doB ?? "",
                                email: store.state.user?.email ?? "No email",
                                repos: store.state.user?.repo ?? [],
                                education: store.state.user?.education ?? "No",
                                inCompany: "\(makeDateDiff(timeStamp: store.state.user?.workingFrom ?? "")) с (\(dateFormatter(date: store.state.user?.workingFrom ?? ""))",
                                extraContact: ExtraContact(
                                    whoHasTo: store.state.user?.additionalContactType ?? "",
                                    name: store.state.user?.additionalContactName ?? "",
                                    phoneNumber: store.state.user?.additionalContactPhone ?? ""
                                )
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
                    }
            }
                HStack {
                    Button {
                        isShowEdit = true
                    } label: {
                        Text("Редактировать")
                    }
                    
                    Spacer()
                    
                    Button {
                        store.dispatch(action: .logOut)
                    } label: {
                        Text("Выйти").foregroundColor(ERROR_COLOR)
                    }
                }
                .padding()
            }
            .navigationBarTitle("\(store.state.user?.firstNameRu ?? "Jhon") \(store.state.user?.lastNameRu ?? "Doe")")
            .sheet(isPresented: $isShowEdit) {
                EditUserView(dismissSheet: dismissSheet)
            }
        }
    }
    
    func dismissSheet() {
        isShowEdit = false
    }
}

struct UserInfoView_Previews: PreviewProvider {
    static var previews: some View {
        UserInfoView()
    }
}
