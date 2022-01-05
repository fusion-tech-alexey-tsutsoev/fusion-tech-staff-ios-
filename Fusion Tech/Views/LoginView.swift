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
    
    // MARK: - STATAES
    @State private var login = ""
    @State private var password = ""
    @State private var isShowSignUp = false
    @State private var isSecure = false
    
    // MARK: - BODY
    var body: some View {
        VStack {
            if store.state.isLoading {
                SplashView(size: 50)
            }
            
            Spacer()
            
            FloatingLabelTextField($login, placeholder: "Email")
                .floatingBaseStyle().disableAutocorrection(true)
                .textInputAutocapitalization(.never)
                .keyboardType(.emailAddress)
            
            FloatingLabelTextField($password, placeholder: "Password")
                .passwordView(isSecure: $isSecure)
            
            Spacer()
            
            VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 20, content: {
                Button(action: {
                    asyncDispatchUser(login: login, password: password, store: store)
                }, label: {
                    Text("Login")
                })
                    .getFilled(isDisabled: false)
                
                Button(action: {
                    isShowSignUp.toggle()
                }, label: {
                    Text("Sign Up")
                })
                    .getOutLined()
            })
        }
        .padding()
        .navigationBarBackButtonHidden(true)
        .background(MAIN_BACKGROUND)
        .sheet(isPresented: $isShowSignUp) {
            SignUpSheetView()
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
