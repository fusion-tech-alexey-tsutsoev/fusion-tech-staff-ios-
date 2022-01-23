//
//  SignUpSheetView.swift
//  Fusion Tech
//
//  Created by Fusion Tech on 14.12.2021.
//

import SwiftUI
import FloatingLabelTextFieldSwiftUI

struct SignUpSheetView: View {
    // MARK: - View Model
    @ObservedObject private var signUpVM = SignUpViewModel()
    let signUpAction: (SignUpViewModel) -> Void
    let OkAction: () -> Void
    
    // MARK: - BODY
    var body: some View {
        VStack {
            if signUpVM.isLoading {
                SplashView(size: 100)
            }
            
            Spacer()
            
            FloatingLabelTextField($signUpVM.login, placeholder: "Login")
                .addValidation(.init(condition: signUpVM.login.isValid(.alphabet), errorMessage: "Invalid Login"))
                .isShowError(true)
                .floatingBaseStyle()
            
            FloatingLabelTextField($signUpVM.password, placeholder: "Password")
                .addValidation(.init(condition: signUpVM.password.isValid(.password), errorMessage: "Invalid Password"))
                .isShowError(true)
                .passwordView(isSecure: $signUpVM.isSecure)
            
            FloatingLabelTextField($signUpVM.email, placeholder: "Email")
                .addValidation(.init(condition: signUpVM.email.isValid(.email), errorMessage: "Invalid Email"))
                .isShowError(true)
                .floatingBaseStyle()
                .keyboardType(.emailAddress)
            
            FloatingLabelTextField($signUpVM.phoneNumber, placeholder: "Phone Number")
                .addValidation(.init(condition: signUpVM.phoneNumber.isValid(.mobileNumber), errorMessage: "Invalid Phone Number"))
                .isShowError(true)
                .floatingBaseStyle()
                .keyboardType(.numberPad)
            
            Spacer()
            
            Button(action: {
                signUpAction(signUpVM)
            }, label: {
                Text("Зарегестрироваться")
            }).getFilled(isDisabled: getDisabled())
        }
        .padding()
        .alert(signUpVM.alertMessage, isPresented: $signUpVM.isShowAlert) {
            Button("Ok") {
                onPressOk()
            }
        }
    }
    
    // MARK: - Helpers
    private func getDisabled() -> Bool {
        return signUpVM.phoneNumber.isEmpty || signUpVM.email.isEmpty || signUpVM.password.isEmpty || signUpVM.login.isEmpty
    }
    
    private func onPressOk() {
        signUpVM.alertMessage = ""
        signUpVM.isShowAlert = false
        OkAction()
    }
}
