//
//  RequestViewModel.swift
//  Fusion Tech
//
//  Created by Fusion Tech on 27.12.2021.
//

import Foundation
import Combine

// MARK: - Model for create request
class RequestViewModel: ObservableObject {
    // MARK: - Variables
    var store: Store
    @Published var requestType: RequstEnum
    @Published var selectedDate = Date()
    @Published var additioanDate = Date()
    @Published var title = ""
    @Published var comment = ""
    
    // MARK: - Options
    @Published var isAllDay = true
    @Published var isMulti = false
    @Published var isShowToggle = false
    @Published var isShowToast = false
    @Published var toastType: ToastEnum = .success
    @Published var toastMessage = ""
    
    @Published var isLoading = false
    
    init (initialType: RequstEnum, store: Store) {
        self.requestType = initialType
        self.store = store
    }
    
    func sendRequest() {
        DispatchQueue.main.async {
            let to = self.isMulti ? self.additioanDate : self.selectedDate
            let requestData = Request(type: self.requestType.rawValue, comment: self.comment, title: self.title, dateFrom: self.selectedDate, dateTo: to)
            
            RequestService.shared.postNewRequest(requestData: requestData) { result in
                self.isShowToast = true
                switch result {
                case .success(let title):
                    self.store.dispatch(action: .setToast(toast: ToastState(message: title, type: .success), isShow: true))
                case .failure(let error):
                    self.store.dispatch(action: .setToast(toast: ToastState(message: error.errorDescriprion, type: .error), isShow: true))
                }
            }
        }
    }
}
