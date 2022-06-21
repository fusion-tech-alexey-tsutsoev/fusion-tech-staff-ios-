//
//  RequestLineView.swift
//  Fusion Tech
//
//  Created by Fusion Tech on 04.01.2022.
//

import SwiftUI

struct RequestLineView: View {
    // MARK: - Screen State
    let request: RequestInfo
    @State private var isCollapsed = true
    
    // MARK: - Body
    var body: some View {
        VStack {
            HStack {
                Image(systemName: getSystemNameByType())
                    .resizable()
                    .frame(width: 30, height: 30, alignment: .center).foregroundColor(getColorByType())
                
                Spacer()
                
                Text(request.title)
                
                Spacer()
                
                Image(systemName: getSystemNameByStatus())
                    .resizable()
                    .foregroundColor(getColorByStatus())
                    .frame(width: 30, height: 30, alignment: .center)
            }
            if !isCollapsed {
                VStack(alignment: .leading, spacing: 10, content: {
                    if let dateFrom = request.dateFrom {
                        Text("Когда")
                        
                        InfoRowView(title: "C", info: DateService.dateFormatter(date: dateFrom))
                        
                        InfoRowView(title: "По", info: DateService.dateFormatter(date: request.dateTo))
                    } else {
                        InfoRowView(title: "Дата: ", info: DateService.dateFormatter(date: request.dateTo))
                    }
                    InfoRowView(title: "Комментарий: ", info: request.comment)
                    
                    InfoRowView(title: "Вынес решение: ", info: getUpdatedBy())
                    
                    InfoRowView(title: "Статус: ", info: request.status.statusRu)
                })
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
            }
        }
        .padding()
        .onTapGesture {
            withAnimation {
                isCollapsed.toggle()
            }
        }
    }
    
    // MARK: - Helpers
    private func getUpdatedBy() -> String {
        guard let updatedBy = request.updatedBy else {
            return "Пока никто"
        }
        return String(updatedBy)
    }
    private func getSystemNameByStatus() -> String {
        switch request.status {
        case .completed:
            return "checkmark.circle.fill"
        case .wait:
            return "clock.arrow.circlepath"
        case .accept:
            return "checkmark.circle"
        case .denied:
            return "x.circle.fill"
        case .inProgress:
            return "clock.badge.checkmark.fill"
        }
    }
    
    private func getColorByStatus() -> Color {
        switch request.status {
        case .wait, .inProgress:
            return Color(uiColor: .systemBlue)
        case .completed, .accept:
            return Color(uiColor: .systemGreen)
        case .denied:
            return Color(uiColor: .systemRed)
        }
    }
    
    private func getSystemNameByType() -> String {
        switch request.type {
        case .dayOff:
            return "figure.walk.circle.fill"
        case .technical:
            return "gear.circle.fill"
        case .documents:
            return "doc.circle.fill"
        case .common:
            return "house.circle.fill"
        case .vacation:
            return "airplane.circle.fill"
        case .medical:
            return "heart.circle.fill"
        }
    }
    
    private func getColorByType() -> Color {
        switch request.type {
        case .dayOff, .vacation:
            return Color(uiColor: .systemOrange)
        case .common, .technical, .documents:
            return Color(uiColor: .systemBlue)
        case .medical:
            return Color(uiColor: .systemRed)
        }
    }
}

struct RequestLineView_Previews: PreviewProvider {
    static var previews: some View {
        RequestLineView(request: RequestInfo(id: 1, title: "Test", type: .dayOff, dateFrom: "", dateTo: "", comment: "Test comment", status: .completed, restDaysNumber: 1, createdAt: "", updatedAt: "", updatedBy: 70, user: [], dates: nil, deniedComment: nil))
    }
}
