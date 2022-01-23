//
//  UserReducer.swift
//  Fusion Tech
//
//  Created by Fusion Tech on 15.12.2021.
//

import Foundation


class UserReducer {
    func updateUser(state: inout UserState, action: UserAction) {
        switch action {
        case .login(let account):
            TokenService.setAccess(token: account.access)
            TokenService.setRefresh(token: account.refresh)
            state.isAuth = true
            state.user = account.user
        case .logOut:
            TokenService.clearTokens()
            state.isAuth = false
            state.user = nil
        case .setLoading(let loading):
            state.isLoading = loading
        case .updateUser(let user):
            state.user = user
            state.isAuth = true
        case .setToast(let toast, let isSHow):
            state.toast = toast
            state.isShowToast = isSHow
        }
    }
}
