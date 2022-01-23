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
    let userId: Int
    
    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            if isLoading {
                SplashView(size: 100)
            }
            if requests.isEmpty {
                EmptyDataView(title: "У Вас нет ни одной заявки")
            } else {
                ForEach(requests) { request in
                    RequestLineView(request: request)
                }
            }
        }
        .onAppear {
            loadRequests()
        }
    }
    
    // MARK: - Helpers
    private func loadRequests() {
        isLoading = true
        RequestService.shared.getUserRequest(userID: userId) { result in
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
