//
//  ContentView.swift
//  Fusion Tech
//
//  Created by Fusion Tech on 27.11.2021.
//

import SwiftUI
import ExytePopupView

struct ContentView: View {
    @EnvironmentObject var store: Store
    
    var body: some View {
        ZStack {
            if store.state.isLoading {
                SplashView(size: 100)
            } else {
                if store.state.isAuth {
                    TabBarView().environmentObject(store)
                } else {
                    LoginView().environmentObject(store)
                }
            }
        }.onAppear {
            asyncCheckUser(store: store)
        }
        .popup(isPresented: $store.state.isShowToast, type: .floater(verticalPadding: 100), position: .bottom, autohideIn: 5, closeOnTapOutside: true) {
            CustomToastView(type: store.state.toast?.type ?? .error, title: store.state.toast?.message ?? "Ошибка")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
