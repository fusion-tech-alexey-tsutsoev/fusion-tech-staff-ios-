//
//  CalenderView.swift
//  Fusion Tech
//
//  Created by Fusion Tech on 11.04.2022.
//

import SwiftUI
import SwiftUICalendar

struct Celebrations: View {
    let controller = CalendarController()
    @State var informations = [YearMonthDay: [(String, Color)]]()
    @State var focusDate: YearMonthDay? = nil
    @State var focusInfo: [(String, Color)]? = nil
    @State var isLoading = false
    
    var body: some View {
        VStack {
            if isLoading {
                SplashView(size: 100)
            } else {
                CalendarView() { date in
                    Text("\(date.day)")
                }
            }
        }
        .frame(maxHeight: .infinity)
        .navigationBarTitle("События")
        .onAppear {
            loadCelebrations()
        }
    }
    
    private func getColor(_ date: YearMonthDay) -> Color {
        if date.dayOfWeek == .sun {
            return PRIMARY_COLOR
        } else if date.dayOfWeek == .sat {
            return Color.blue
        } else {
            return FONT_COLOR
        }
    }
    
    private func loadCelebrations() {
        var temInfos = [YearMonthDay: [(String, Color)]]()
        let currentYear = YearMonthDay.current.year
        isLoading = true
        DispatchQueue.main.async {
            ListsServices.shared.getActiveUser { result in
                switch result {
                case .success(let members):
                    members.forEach { member in
                        guard let dob = member.doB else {
                            return
                        }
                                                
                        let birthDay = Calendar.current.dateComponents(
                            [ .month, .year],
                            from: DateService.timeStampFormatter(date: dob))
                    
                        if (temInfos[YearMonthDay(year: currentYear, month: birthDay.month ?? 1, day: birthDay.day ?? 1)] == nil) {
                            temInfos[YearMonthDay(year: currentYear, month: birthDay.month ?? 1, day: birthDay.day ?? 1)] = []
                        }
                        
                        temInfos[YearMonthDay(year: currentYear, month: birthDay.month ?? 1, day: birthDay.day ?? 1)]?.append(("День Рождения \(member.firstNameRu ?? "Jhon") \(member.lastNameRu ?? "Doe")", PRIMARY_COLOR))
                        
                        
                        guard let workingFrom = member.workingFrom else {
                            return
                        }
                        
                        let workingDateComponets = Calendar.current.dateComponents(
                            [ .month, .day], from: DateService.timeStampFormatter(date: workingFrom))
                        
                        if (temInfos[YearMonthDay(year: currentYear, month: workingDateComponets.month ?? 1, day: workingDateComponets.day ?? 1)] == nil) {
                            temInfos[YearMonthDay(year: currentYear, month: workingDateComponets.month ?? 1, day: workingDateComponets.day ?? 1)] = []
                        }
                                                
                        temInfos[YearMonthDay(year: currentYear, month: workingDateComponets.month ?? 1, day: workingDateComponets.day ?? 1)]?.append(("Годовщина работы \(member.firstNameRu ?? "Jhon") \(member.lastNameRu ?? "Doe")", Color.blue))
                        
                    }
                case .failure(let err):
                    print("err \(err)")
                }
                
                informations = temInfos
                isLoading = false
            }
        }
    }
}
