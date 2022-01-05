//
//  TechRoles.swift
//  Fusion Tech
//
//  Created by Fusion Tech on 22.12.2021.
//

import Foundation

func convertTechRole(role: String?) -> String {
    switch role {
    case "admin":
        return "Администратор"
    case "sales":
        return "Сейлз"
    case "techLead":
        return "Техлид"
    case "projectManager":
        return "Проджект менеджер"
    case "developer":
        return "Разработчик"
    case "designer":
        return "Дизайнер"
    case "qaEngineer":
        return "Тестировщик"
    case "hr":
        return "HR"
    case "officeManager":
        return "Офис менеджер"
    case "englishTeacher":
        return "Преподаватель английского"
    default:
        return "Пользователь"
    }
}
