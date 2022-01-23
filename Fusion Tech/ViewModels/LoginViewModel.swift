//
//  LoginViewModel.swift
//  Fusion Tech
//
//  Created by Fusion Tech on 10.01.2022.
//

import SwiftUI

// MARK: - Model for login
class LoginViewModel: ObservableObject {
    @Published var login = "alexey" // temp
    @Published var password = "qweqwe" // temp
    @Published var isShowSignUp = false
    @Published var isSecure = false
}
