//
//  PDFExporter.swift
//  Fusion Tech
//
//  Created by Fusion Tech on 14.02.2022.
//

import Foundation
import UniformTypeIdentifiers
import SwiftUI
import PDFKit

struct PDFExporter: FileDocument {
     static var readableContentTypes = [UTType.pdf]

     var pdfDocuemnt = PDFDocument()

     init(initialDocuemnt: PDFDocument = PDFDocument()) {
         pdfDocuemnt = initialDocuemnt
     }

     init(configuration: ReadConfiguration) throws {
         if let data = configuration.file.regularFileContents {
             if let document = PDFDocument(data: data) {
                 pdfDocuemnt = document
             }
         }
     }

     func fileWrapper(configuration: WriteConfiguration) throws -> FileWrapper {
         if let data = pdfDocuemnt.dataRepresentation() {
             return FileWrapper(regularFileWithContents: data)
         }
         throw NSError(domain: "ERR_FROM_FILEFRAPPER", code: -1)
     }
}
