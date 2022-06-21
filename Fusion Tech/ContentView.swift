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
                LaunchView()
            } else {
                if store.state.isAuth {
                    TabBarView().environmentObject(store)
                } else {
                    LoginView().environmentObject(store)
                }
            }
            
            
            CustomToastView(isPresent: store.state.isShowToast)
                .onChange(of: store.state.isShowToast) { newValue in
                    if newValue {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                            withAnimation {
                                store.dispatch(action: .setToast(toast: nil, isShow: false))
                            }
                        }
                    }
                }
            
        }
        .onAppear {
            store.dispatch(action: .setLoading(value: true))
            DispatchQueue.main.async {
                UserService.shared.checkUser { result in
                    guard let user = try? result.get() else {
                        store.dispatch(action: .setLoading(value: false))
                        return
                    }
                    store.dispatch(action: .updateUser(user: user))
                    store.dispatch(action: .setLoading(value: false))
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
