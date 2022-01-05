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
        ScrollView {
            if isLoading {
                SplashView(size: 100)
            }
            ForEach(requests) { request in
                RequestLineView(request: request)
            }
        }.onAppear {
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
}

struct RequestSectionView_Previews: PreviewProvider {
    static var previews: some View {
        RequestSectionView(userId: 98)
    }
}
