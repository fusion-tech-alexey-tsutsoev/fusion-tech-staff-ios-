//
//  UserMiddlewares.swift
//  Fusion Tech
//
//  Created by Fusion Tech on 16.12.2021.
//

import Foundation

//// MARK: - Set User
//func asyncDispatchUser(login: String, password: String, store: Store) {
//    DispatchQueue.main.async {
//        store.dispatch(action: .setLoading(value: true))
//        UserService.shared.login(email: login, password: password) { result in
//            switch result {
//            case .success(let account):
//                store.dispatch(action: .login(account: account))
//            case .failure(let error):
//                store.dispatch(action: .setToast(toast: ToastState(message: error.errorDescriprion, type: .error), isShow: true))
//            }
//            store.dispatch(action: .setLoading(value: false))
//        }
//    }
//}
//
//// MARK: - Check User
//func asyncCheckUser(store: Store) {
//    store.dispatch(action: .setLoading(value: true))
//    DispatchQueue.main.async {
//        UserService.shared.checkUser { result in
//            guard let user = try? result.get() else {
//                store.dispatch(action: .setLoading(value: false))
//                return
//            }
//            store.dispatch(action: .updateUser(user: user))
//            store.dispatch(action: .setLoading(value: false))
//        }
//    }
//}
//
//
//// MARK: - Update USer
func asyncUpdateUser(payload: UpdateUserPayload, id: Int, store: Store) {
    store.dispatch(action: .setLoading(value: true))
    DispatchQueue.main.async {
        UserService.shared.updateUserInfo(data: payload, id: id) { result in
            switch result {
            case .success(let user):
                store.dispatch(action: .updateUser(user: user))
                store.dispatch(action: .setToast(toast: ToastState(message: "Данные успешно обновлены", type: .success), isShow: true))
            case .failure(let error):
                store.dispatch(action: .setToast(toast: ToastState(message: error.errorDescriprion, type: .error), isShow: true))
            }
            store.dispatch(action: .setLoading(value: false))
        }
    }
}
