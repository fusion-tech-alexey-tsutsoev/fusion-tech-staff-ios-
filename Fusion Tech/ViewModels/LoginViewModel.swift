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
    @Published var isLoading = false
    
    func signIn(store: Store) {
        DispatchQueue.main.async {
            self.setLoading(newValue: true)
            UserService.shared.login(email: self.login, password: self.password) { result in
                switch result {
                case .success(let account):
                    store.dispatch(action: .login(account: account))
                case .failure(let error):
                    withAnimation {
                        store.dispatch(action: .setToast(toast: ToastState(message: error.errorDescriprion, type: .error), isShow: true))
                    }
                }
                self.setLoading(newValue: false)
            }
        }
    }
    
    func setLoading(newValue: Bool) {
        isLoading = newValue
    }
}
