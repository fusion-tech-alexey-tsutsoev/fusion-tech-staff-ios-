//
//  LoginView.swift
//  Fusion Tech
//
//  Created by Fusion Tech on 14.12.2021.
//

import SwiftUI
import FloatingLabelTextFieldSwiftUI

struct LoginView: View {
    // MARK: - Enviroment
    @EnvironmentObject var store: Store
    
    // MARK: - View Model
    @ObservedObject private var loginVM = LoginViewModel()
    
    // MARK: - BODY
    var body: some View {
        VStack {
            Spacer()
            
            FloatingLabelTextField($loginVM.login, placeholder: "Email")
                .floatingBaseStyle()
                .disableAutocorrection(true)
                .textInputAutocapitalization(.never)
                .keyboardType(.emailAddress)
            
            FloatingLabelTextField($loginVM.password, placeholder: "Password")
                .passwordView(isSecure: $loginVM.isSecure)
            
            Spacer()
            
            VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 20, content: {
                CustomButton(
                    onPress: { loginVM.signIn(store: store) },
                    label: "Вход",
                    isLoading: loginVM.isLoading
                )
                
                CustomButton(
                    onPress: { loginVM.isShowSignUp.toggle() },
                    label: "Регистрация",
                    type: .outlined
                )
            })
        }
        .padding()
        .background(MAIN_BACKGROUND)
        .sheet(isPresented: $loginVM.isShowSignUp) {
            SignUpSheetView(signUpAction: signUp, OkAction: dissmissSHeet)
        }
    }
    
    //MARK: - Helpers
    private func signUp(signUpData: SignUpViewModel) {
        DispatchQueue.main.async {
            signUpData.isLoading = true
            UserService.shared
                .signUp(data: SignUpParameters(email: signUpData.email, login: signUpData.login, password: signUpData.password, phone: signUpData.phoneNumber)) { result in
                    switch result {
                    case .failure(let apiError):
                        signUpData.alertMessage = apiError.errorDescriprion
                    case .success(let message):
                        signUpData.alertMessage = message
                    }
                    signUpData.isLoading = false
                    signUpData.isShowAlert = true
                }
        }
    }
    
    private func dissmissSHeet() {
        loginVM.isShowSignUp = false
    }
}
