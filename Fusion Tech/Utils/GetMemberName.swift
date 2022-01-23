//
//  GetMemberName.swift
//  Fusion Tech
//
//  Created by Fusion Tech on 10.01.2022.
//

import Foundation

func getFullNameString(member: TeamMember) -> String {
    var firstName = "Jhon"
    var lastName = "Doe"
    
    if let memberFirstName = member.firstName, let memberLastName = member.lastName {
        firstName = memberFirstName.isEmpty ? firstName : memberFirstName
        lastName = memberLastName.isEmpty ? lastName : memberLastName
    }
    
    if let memberFirstNameRu = member.firstNameRu, let memberLastNameRu = member.lastNameRu {
        firstName = memberFirstNameRu.isEmpty ? firstName : memberFirstNameRu
        lastName = memberLastNameRu.isEmpty ? lastName : memberLastNameRu
    }
    
    return "\(firstName) \(lastName)"
}
