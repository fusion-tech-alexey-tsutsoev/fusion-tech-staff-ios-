//
//  LoginViewModel.swift
//  Fusion Tech
//
//  Created by Fusion Tech on 10.01.2022.
//

import SwiftUI

// MARK: - Model for login
class LoginViewModel: ObservableObject {
    @Published var login = ""
    @Published var password = ""
    @Published var isShowSignUp = false
    @Published var isSecure = false
}
