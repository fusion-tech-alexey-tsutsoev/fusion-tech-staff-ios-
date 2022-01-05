//
//  Store.swift
//  Fusion Tech
//
//  Created by Fusion Tech on 15.12.2021.
//

import Foundation

typealias Dispatch = (_ action: UserAction) -> Void

final class Store: ObservableObject {
    var reducer: UserReducer
    @Published var state: UserState
    
    init(state: UserState, reducer: UserReducer = UserReducer()) {
        self.reducer = reducer
        self.state = state
    }
    
    public func dispatch(action: UserAction) {
        self.reducer.updateUser(state: &state, action: action)
    }
}
