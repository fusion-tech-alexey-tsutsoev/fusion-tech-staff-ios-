//
//  DateFormatter.swift
//  Fusion Tech
//
//  Created by Fusion Tech on 20.12.2021.
//

import Foundation

// MARK: - Format timestamp string to "d, MM YYYY" date
func dateFormatter(date: String) -> String {
    let formatterStringToDate = DateFormatter()
    formatterStringToDate.locale = Locale(identifier: "en_US_POSIX")
    formatterStringToDate.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
    guard let date = formatterStringToDate.date(from: date) else {
        return "Invalid Date"
    }
    
    let formatterDateToString = DateFormatter()
    formatterDateToString.dateFormat = "d, MMM YYYY"
    formatterDateToString.locale = Locale(identifier: "ru_RU")
    return formatterDateToString.string(from: date)
}
