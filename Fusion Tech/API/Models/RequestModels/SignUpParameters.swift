//
//  SignUp.swift
//  Fusion Tech
//
//  Created by Fusion Tech on 11.01.2022.
//

import Foundation

struct SignUpParameters: Encodable {
    let email: String
    let login: String
    let password: String
    let phone: String
}
