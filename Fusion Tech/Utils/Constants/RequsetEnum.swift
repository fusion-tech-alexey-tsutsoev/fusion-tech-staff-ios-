//
//  RequsetEnum.swift
//  Fusion Tech
//
//  Created by Fusion Tech on 27.12.2021.
//

import Foundation

enum RequstEnum: String, CaseIterable, Identifiable {
    case dayOff
    case technical
    case documents
    case common
    case vacation
    case medical
    
    var id: String { self.rawValue }
    
    var value: String {
        switch self {
        case .common:
            return "Бытовой"
        case .dayOff:
            return "Отгул"
        case .technical:
            return "Технический"
        case .documents:
            return "Документы"
        case .vacation:
            return "Отпуск"
        case .medical:
            return "Больничный"
        }
    }
}
