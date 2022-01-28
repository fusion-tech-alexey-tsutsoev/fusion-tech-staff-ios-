//
//  EditUserView.swift
//  Fusion Tech
//
//  Created by Fusion Tech on 13.01.2022.
//

import SwiftUI
import FloatingLabelTextFieldSwiftUI
import ExytePopupView

struct EditUserView: View {
    // MARK: - Data
    @EnvironmentObject var store: Store
    @ObservedObject var editUserVM = EditUserViewModel()
    
    let dismissSheet: () -> Void
    
    var body: some View {
        VStack {
            Text("Редактирование Пользователя").bold().font(.title2)
            ScrollView {
                Group {
                    FloatingLabelTextField($editUserVM.login, placeholder: "Login")
                        .floatingBaseStyle()
                        .disableAutocorrection(true)
                        .textInputAutocapitalization(.never)
                    
                    FloatingLabelTextField($editUserVM.email, placeholder: "Email")
                        .floatingBaseStyle()
                        .disableAutocorrection(true)
                        .textInputAutocapitalization(.never)
                        .textInputAutocapitalization(.never)
                        .keyboardType(.emailAddress)
                    
                    FloatingLabelTextField($editUserVM.slackName, placeholder: "Slack Name")
                        .floatingBaseStyle()
                        .disableAutocorrection(true)
                        .textInputAutocapitalization(.never)
                    
                    FloatingLabelTextField($editUserVM.phoneNumber, placeholder: "Телефон")
                        .floatingBaseStyle()
                        .keyboardType(.phonePad)
                }
                
                Group {
                    FloatingLabelTextField($editUserVM.firstName, placeholder: "Имя (en)")
                        .floatingBaseStyle()
                    
                    FloatingLabelTextField($editUserVM.firstNameRu, placeholder: "Имя (ru)")
                        .floatingBaseStyle()
                    
                    FloatingLabelTextField($editUserVM.lastName, placeholder: "Фамилия (en)")
                        .floatingBaseStyle()
                    
                    FloatingLabelTextField($editUserVM.lastNameRu, placeholder: "Фамилия (ru)")
                        .floatingBaseStyle()
                }
                
                CustomDivider()
                
                Group {
                    DatePicker("День Рождения", selection: $editUserVM.dob, displayedComponents: .date)
                        .environment(\.locale, Locale(identifier: "ru_RU"))
                        .padding(.bottom, 20)
                    
                    Button {
                        editUserVM.repos.append("")
                    } label: {
                        Text("Добавить репозиторий")
                    }
                    
                    ForEach($editUserVM.repos, id: \.self) { repo in
                        FloatingLabelTextField(repo, placeholder: "Новый репозиторий")
                            .floatingBaseStyle()
                            .disableAutocorrection(true)
                            .textInputAutocapitalization(.never)
                            .textInputAutocapitalization(.never)
                            .keyboardType(.URL)
                    }
                    
                    CustomDivider()
                    
                    FloatingLabelTextField($editUserVM.info, placeholder: "Информация")
                        .floatingBaseStyle()
                }
            }
            .padding(.bottom)
            
            HStack {
                Button {
                    onConfirm()
                } label: {
                    Text("Принять")
                }
                .foregroundColor(PRIMARY_COLOR)
                
                Spacer()
                
                Button {
                    dismissSheet()
                } label: {
                    Text("Отменить")
                }
                .foregroundColor(ERROR_COLOR)
                
            }
            
        }
        .onAppear {
            editUserVM.initUser(userInfo: store.state.user)
        }
        .padding()
    }
    
    // MARK: - Helpers
    private func onConfirm() {
        if let id = store.state.user?.id {
            asyncUpdateUser(payload: UpdateUserPayload(login: editUserVM.login, phone: editUserVM.phoneNumber, slackName: editUserVM.slackName, email: editUserVM.email, firstName: editUserVM.firstName, firstNameRu: editUserVM.firstNameRu, lastName: editUserVM.lastName, lastNameRu: editUserVM.lastNameRu, education: editUserVM.education, educationRu: editUserVM.education, info: editUserVM.info, doB: editUserVM.dob.formatted(.iso8601), repo: editUserVM.repos), id: id, store: store)
        } else {
            store.dispatch(action: .setToast(toast: ToastState(message: "Ошибка с ID пользователя", type: .error), isShow: true))
        }
        dismissSheet()
    }
}
