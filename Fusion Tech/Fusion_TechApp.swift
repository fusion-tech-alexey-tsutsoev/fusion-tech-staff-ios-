//
//  Fusion_TechApp.swift
//  Fusion Tech
//
//  Created by Fusion Tech on 27.11.2021.
//

import SwiftUI

@main
struct Fusion_TechApp: App {
    var body: some Scene {
        WindowGroup {
            
            let state = UserState()
            let reducer = UserReducer()
            let store = Store(state: state, reducer: reducer)
            
            ContentView().environmentObject(store)
        }
    }
}
