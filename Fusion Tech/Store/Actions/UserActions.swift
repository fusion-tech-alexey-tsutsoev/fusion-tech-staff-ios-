//
//  UserActions.swift
//  Fusion Tech
//
//  Created by Fusion Tech on 15.12.2021.
//

import Foundation

enum UserAction {
    case login(account: Account)
    case updateUser(user: User)
    case logOut
    case setLoading(value: Bool)
    case setToast(toast: ToastState?, isShow: Bool)
}
