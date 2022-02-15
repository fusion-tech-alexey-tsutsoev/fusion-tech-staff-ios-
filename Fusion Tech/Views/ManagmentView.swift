//
//  ManagmentView.swift
//  Fusion Tech
//
//  Created by Fusion Tech on 06.02.2022.
//

import SwiftUI
import FloatingLabelTextFieldSwiftUI
import PDFKit

struct ManagmentView: View {
    @ObservedObject private var managmentVM = ManagmentViewModel()
    
    var body: some View {
        VStack {
            ScrollView {
                FloatingLabelTextField($managmentVM.clientComanyName, placeholder: "Client Company name")
                    .floatingBaseStyle()
                    .disableAutocorrection(true)
                
                FloatingLabelTextField($managmentVM.cleintTeamName, placeholder: "Client team names", commit:  {
                    withAnimation {
                        managmentVM.clientTeamNames.append(managmentVM.cleintTeamName)
                        managmentVM.cleintTeamName = ""
                    }
                })
                    .floatingBaseStyle()
                    .disableAutocorrection(true)
                
                ForEach(managmentVM.clientTeamNames, id: \.self) { clientName in
                    Text(clientName).padding(.top)
                    CustomDivider()
                }
                
                FloatingLabelTextField($managmentVM.yourTeamName, placeholder: "Your team names", commit: {
                    withAnimation {
                        managmentVM.yourTeamNames.append(managmentVM.yourTeamName)
                        managmentVM.yourTeamName = ""
                    }
                })
                    .floatingBaseStyle()
                    .disableAutocorrection(true)
                
                ForEach(managmentVM.yourTeamNames, id: \.self) { yourName in
                    Text(yourName).padding(.top)
                    CustomDivider()
                }
                
                FloatingLabelTextField($managmentVM.discussionItem, placeholder: "Discussion Items", commit: {
                    withAnimation {
                        managmentVM.discussionItems.append(managmentVM.discussionItem)
                        managmentVM.discussionItem = ""
                    }
                })
                    .floatingBaseStyle()
                    .disableAutocorrection(true)
                
                ForEach(managmentVM.discussionItems, id: \.self) { item in
                    Text(item).padding(.top)
                    CustomDivider()
                }
                
                FloatingLabelTextField($managmentVM.arragement, placeholder: "Arragements", commit: {
                    withAnimation {
                        managmentVM.arragements.append(managmentVM.arragement)
                        managmentVM.arragement = ""
                    }
                })
                    .floatingBaseStyle()
                    .disableAutocorrection(true)
                
                ForEach(managmentVM.arragements, id: \.self) { arragement in
                    Text(arragement).padding(.top)
                    CustomDivider()
                }
                
                VStack {
                    Text("Дополнительная информация")
                    TextEditor(text: $managmentVM.additionalInfo)
                        .background(SECUNDARY_COLOR)
                        .border(PRIMARY_COLOR)
                }
                .padding(.vertical)
            }
            
            Button {
                managmentVM.isShowExporter = true
            } label: {
                Text("Cоздать письмо")
            }
            .getFilled(isDisabled: false)
            
        }
        .padding()
        .fileExporter(isPresented: $managmentVM.isShowExporter, documents: [createPDF()], contentType: .pdf) { result in
            switch (result) {
            case .success(let url):
                print("Saved to \(url)")
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
    }
    
    private func createPDF() -> PDFExporter {
        let pdfCreator = PDFCreator(fusionMembers: managmentVM.yourTeamNames,
                                    clientCompanyName: managmentVM.clientComanyName,
                                    clientTeam: managmentVM.clientTeamNames,
                                    discussionItems: managmentVM.discussionItems,
                                    arrigments: managmentVM.arragements,
                                    additionalInfo: managmentVM.additionalInfo)
        return PDFExporter(initialDocuemnt: PDFDocument(data: pdfCreator.createPDF())!)
    }
}
