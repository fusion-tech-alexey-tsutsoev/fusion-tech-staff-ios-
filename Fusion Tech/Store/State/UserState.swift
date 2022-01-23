//
//  AppState.swift
//  Fusion Tech
//
//  Created by Fusion Tech on 15.12.2021.
//

import Foundation

struct UserState {
    var user: User? = nil
    var isAuth: Bool = false
    var isLoading: Bool = false
    var isError: Bool = false
    var error: ApiError? = nil
    var toast: ToastState? = nil
    var isShowToast = false
}
