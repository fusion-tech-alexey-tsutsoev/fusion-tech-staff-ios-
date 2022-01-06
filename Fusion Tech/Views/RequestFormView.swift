//
//  RequestFormView.swift
//  Fusion Tech
//
//  Created by Fusion Tech on 27.12.2021.
//

import SwiftUI
import FloatingLabelTextFieldSwiftUI

struct RequestFormView: View {
    @ObservedObject private var requestVM = RequestViewModel()
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10, content: {
            Picker("Тип заявки", selection: $requestVM.requestType) {
                ForEach(RequstEnum.allCases) {
                    requestType in
                    Text(requestType.value).tag(requestType)
                }
            }
            .pickerStyle(.wheel)
            
            Spacer()
            
            DatePicker("Дата заявки", selection: $requestVM.selectedDate, in: Date()..., displayedComponents: !requestVM.isAllDay ? [.date, .hourAndMinute] : .date)
                .environment(\.locale, Locale(identifier: "ru_RU"))
            
            if requestVM.isMulti {
                DatePicker("Дата окончания", selection: $requestVM.additioanDate, in: requestVM.selectedDate..., displayedComponents: .date)
                    .environment(\.locale, Locale(identifier: "ru_RU"))
            }
            
            if !requestVM.isAllDay {
                DatePicker("Дата окончания", selection: $requestVM.additioanDate, in: requestVM.selectedDate..., displayedComponents: [.date, .hourAndMinute]).environment(\.locale, Locale(identifier: "ru_RU"))
            }
            
            if requestVM.isShowToggle {
                Toggle("На весь день?", isOn: $requestVM.isAllDay.animation())
            }
            
            FloatingLabelTextField($requestVM.title, placeholder: "Заголвоок")
                .addValidation(.init(condition: !requestVM.title.isEmpty, errorMessage: "Заголовок обязателен"))
                .isShowError(true)
                .floatingBaseStyle()
            
            FloatingLabelTextField($requestVM.comment, placeholder: "Коментарий")
                .addValidation(.init(condition: !requestVM.comment.isEmpty, errorMessage: "Комментарий обязателен"))
                .isShowError(true)
                .floatingBaseStyle()
            
            Spacer()
            
            Button {
                DispatchQueue.main.async {
                    let to = requestVM.isMulti ? requestVM.additioanDate : requestVM.selectedDate
                    let requestData = Request(type: requestVM.requestType.rawValue, comment: requestVM.comment, title: requestVM.title, dateFrom: requestVM.selectedDate, dateTo: to)
                    
                    RequestService.shared.postNewRequest(requestData: requestData) { result in
                        print("Test", result)
                    }
                }
            } label: {
                Text("Отправить")
            }
            .getFilled(isDisabled: requestVM.title.isEmpty || requestVM.comment.isEmpty)
            .disabled(requestVM.title.isEmpty || requestVM.comment.isEmpty)
            
        })
            .frame(
                minWidth: 0,
                maxWidth: .infinity,
                minHeight: 0,
                maxHeight: .infinity,
                alignment: .topLeading
            )
            .padding()
            .onReceive(requestVM.$requestType) { newType in
                withAnimation(.easeOut(duration: 0.5)) {
                    requestVM.isMulti = newType == .vacation || newType == .medical
                    requestVM.isShowToggle = newType == .dayOff
                    requestVM.isAllDay = newType != .dayOff
                }
            }
    }
}

struct RequestFormView_Previews: PreviewProvider {
    static var previews: some View {
        RequestFormView()
    }
}
