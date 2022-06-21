//
//  DateFormatter.swift
//  Fusion Tech
//
//  Created by Fusion Tech on 20.12.2021.
//

import Foundation

public class DateService {
    // MARK: - Format timeStamp to Date
    static func timeStampFormatter(date: String) -> Date {
        let formatterStringToDate = DateFormatter()
        formatterStringToDate.locale = Locale(identifier: "en_US_POSIX")
        formatterStringToDate.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"

        return formatterStringToDate.date(from: date) ?? Date()
    }

    // MARK: - Format timestamp string to "d, MM YYYY" date
    static func dateFormatter(date: String?) -> String {
        guard let unwrappedDate = date else { return "Нет даты" }
        let formatteTimeStamp = timeStampFormatter(date: unwrappedDate)
        
        let formatterDateToString = DateFormatter()
        formatterDateToString.dateFormat = "d, MMM YYYY"
        formatterDateToString.locale = Locale(identifier: "ru_RU")
        return formatterDateToString.string(from: formatteTimeStamp)
    }

    // MARK: - Eng Format Date string to "EEEE d, MM YYYY" date
    static func engDateFormatter(date: Date) -> String {
        let formatterDateToString = DateFormatter()
        formatterDateToString.dateFormat = "EEEE d, MMMM YYYY"
        formatterDateToString.locale = Locale(identifier: "en_EN")
        return formatterDateToString.string(from: date)
    }

    // MARK: - Make diff between timestamp and current day
    static func makeDateDiff(timeStamp: String) -> String {
        let formattedTimeStamp = timeStampFormatter(date: timeStamp)
        
        let componentsFormatter = DateComponentsFormatter()
        componentsFormatter.unitsStyle = .abbreviated
        componentsFormatter.allowedUnits = [. year, .month, .day]
        
        let interval = Date().timeIntervalSince(formattedTimeStamp)
        return componentsFormatter.string(from: interval) ?? "Invalid Date"
    }

}
