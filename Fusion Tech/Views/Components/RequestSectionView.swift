//
//  RequestSectionView.swift
//  Fusion Tech
//
//  Created by Fusion Tech on 04.01.2022.
//

import SwiftUI

struct RequestSectionView: View {
    // MARK: - Screen State
    @State private var isLoading = false
    @State private var requests: [RequestInfo] = []
    let userId: Int?
    
    var body: some View {
        VStack {
            if isLoading {
                SplashView(size: 100)
            }
            if requests.isEmpty {
                EmptyDataView(title: "У Вас нет ни одной заявки")
            } else {
                ScrollView {
                    ForEach(requests) { request in
                        RequestLineView(request: request)
                    }
                }
            }
        }
        .frame(
              minWidth: 0,
              maxWidth: .infinity,
              minHeight: 0,
              maxHeight: .infinity,
              alignment: .center
            )
        .onAppear {
            loadRequests()
        }
    }
    
    // MARK: - Helpers
    private func loadRequests() {
        guard let id = userId else {
            return
        }
        isLoading = true
        RequestService.shared.getUserRequest(userID: id) { result in
            print("result \(result)")
            guard let requestsFromApi = try? result.get() else {
                return
            }
            requests = requestsFromApi
        }
        isLoading = false
    }
}

struct RequestSectionView_Previews: PreviewProvider {
    static var previews: some View {
        RequestSectionView(userId: 98)
    }
}
