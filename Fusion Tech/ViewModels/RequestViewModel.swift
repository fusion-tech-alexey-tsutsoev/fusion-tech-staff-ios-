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
    @Published var requestType: RequstEnum = .dayOff
    @Published var selectedDate = Date()
    @Published var additioanDate = Date()
    @Published var title = ""
    @Published var comment = ""
    
    // MARK: - Options
    @Published var isAllDay = true
    @Published var isMulti = false
    @Published var isShowToggle = false
}
