//
//  RequestFormView.swift
//  Fusion Tech
//
//  Created by Fusion Tech on 27.12.2021.
//

import SwiftUI
import FloatingLabelTextFieldSwiftUI
import ExytePopupView

struct RequestFormView: View {
    @ObservedObject var requestVM: RequestViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10, content: {
            ScrollView {
                HStack {
                    Text("Тип заявки: ")
                    Spacer()
                    Picker("Тип заявки", selection: $requestVM.requestType) {
                        ForEach(RequstEnum.allCases) {
                            requestType in
                            Text(requestType.value).tag(requestType)
                        }
                    }
                    .pickerStyle(.menu)
                }
                .padding(.vertical)
                
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
                
                FloatingLabelTextField($requestVM.title, placeholder: "Заголовок")
                    .addValidation(.init(condition: !requestVM.title.isEmpty, errorMessage: "Заголовок обязателен"))
                    .isShowError(true)
                    .floatingBaseStyle()
                
                FloatingLabelTextField($requestVM.comment, placeholder: "Комментарий")
                    .addValidation(.init(condition: !requestVM.comment.isEmpty, errorMessage: "Комментарий обязателен"))
                    .isShowError(true)
                    .floatingBaseStyle()
            }
            
            CustomButton(
                onPress: { requestVM.sendRequest() },
                label: "Отправить",
                isLoading: requestVM.isLoading,
                type: .filled,
                disabled: requestVM.title.isEmpty || requestVM.comment.isEmpty
            )
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
                updateType(type: newType)
            }
            .popup(isPresented: $requestVM.isShowToast, type: .floater(verticalPadding: 100), position: .bottom, autohideIn: 5, closeOnTapOutside: true) {
                // TODO: - improve
//                CustomToastView()
            }
    }
    
    // MARK: - Helpers
    private func updateType(type: RequstEnum) {
        withAnimation(.easeOut(duration: 0.5)) {
            requestVM.isMulti = type == .vacation || type == .medical
            requestVM.isShowToggle = type == .dayOff
            requestVM.isAllDay = type != .dayOff
        }
    }
    
    private func sendRequest() {
        DispatchQueue.main.async {
            let to = requestVM.isMulti ? requestVM.additioanDate : requestVM.selectedDate
            let requestData = Request(type: requestVM.requestType.rawValue, comment: requestVM.comment, title: requestVM.title, dateFrom: requestVM.selectedDate, dateTo: to)
            
            RequestService.shared.postNewRequest(requestData: requestData) { result in
                requestVM.isShowToast = true
                switch result {
                case .success(let title):
                    requestVM.toastType = .success
                    requestVM.toastMessage = title
                case .failure(let error):
                    requestVM.toastType = .error
                    requestVM.toastMessage = error.errorDescriprion
                }
            }
        }
    }
}
