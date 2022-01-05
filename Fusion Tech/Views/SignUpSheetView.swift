//
//  SignUpSheetView.swift
//  Fusion Tech
//
//  Created by Fusion Tech on 14.12.2021.
//

import SwiftUI
import FloatingLabelTextFieldSwiftUI

struct SignUpSheetView: View {
    // MARK: - STATES
    @State private var login = ""
    @State private var email = ""
    @State private var phoneNumber = ""
    @State private var password = ""
    @State private var isSecure = false
    
    // MARK: - BODY
    var body: some View {
        VStack {
            Spacer()
            
            FloatingLabelTextField($login, placeholder: "Login").floatingBaseStyle()
            
            FloatingLabelTextField($password, placeholder: "Password").passwordView(isSecure: $isSecure)
            
            FloatingLabelTextField($email, placeholder: "Email").floatingBaseStyle()
            
            FloatingLabelTextField($login, placeholder: "Phone Number").floatingBaseStyle().keyboardType(.numberPad)
            
            Spacer()
            
            Button(action: {
                print("test")
            }, label: {
                Text("Sign Up")
            }).getOutLined()
        }.padding()
    }
}

struct SignUpSheetView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpSheetView()
    }
}
