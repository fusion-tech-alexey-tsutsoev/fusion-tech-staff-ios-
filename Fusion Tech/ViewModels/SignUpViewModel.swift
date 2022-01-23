//
//  SignUpViewModel.swift
//  Fusion Tech
//
//  Created by Fusion Tech on 06.01.2022.
//

import SwiftUI

// MARK: - Model for sign up
class SignUpViewModel: ObservableObject {
    @Published var login = ""
    @Published var email = ""
    @Published var phoneNumber = ""
    @Published var password = ""
    @Published var isSecure = true
    @Published var isLoading = false
    @Published var isShowAlert = false
    @Published var alertMessage = ""
}
