//
//  DataRequestExtention.swift
//  Fusion Tech
//
//  Created by Fusion Tech on 03.01.2022.
//

import Foundation
import Alamofire

extension DataRequest {
    func customValidate(url: String) -> Self {
        return self.validate { request, response, data -> Request.ValidationResult in
            let statusCode = response.statusCode
            if statusCode != 401 {
                return .success(())
            } else {
                let authenticationAction = self.getAuthenticationAction(url, statusCode: statusCode, data: data)
                return .failure(AFError.responseValidationFailed(reason: .unacceptableStatusCode(code: authenticationAction.rawValue)))
            }
        }
    }
}
