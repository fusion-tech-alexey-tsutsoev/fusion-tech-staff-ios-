//
//  HomeNavigation.swift
//  Fusion Tech
//
//  Created by Fusion Tech on 24.01.2022.
//

import SwiftUI


import SwiftUI

class RootNavigation: ObservableObject {
    @Published var currentPage: TabRouter = .home
    @Published var requestType: RequstEnum = .dayOff
}
