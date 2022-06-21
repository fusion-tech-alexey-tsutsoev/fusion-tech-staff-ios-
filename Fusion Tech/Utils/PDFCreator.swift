//
//  PDFCreator.swift
//  Fusion Tech
//
//  Created by Fusion Tech on 06.02.2022.
//

// TODO: 1) Add Gradient

import Foundation
import PDFKit
import SwiftUI

class PDFCreator {
    let formattedDate: String
    let fusionMembers: [String]
    let clientCompanyName: String
    let clientTeam: [String]
    let discussionItems: [String]
    let arrigments: [String]
    let additionalInfo: String?
    
    init(fusionMembers: [String], clientCompanyName: String, clientTeam: [String], discussionItems: [String], arrigments: [String], additionalInfo: String?) {
        formattedDate = DateService.engDateFormatter(date: Date())
        self.fusionMembers = fusionMembers
        self.clientCompanyName = clientCompanyName
        self.clientTeam = clientTeam
        self.discussionItems = discussionItems
        self.arrigments = arrigments
        self.additionalInfo = additionalInfo
    }
    
    func createPDF() -> Data {
        // MARK: - create meta
        let pdfMetaData = [
            kCGPDFContextCreator: "something",
            kCGPDFContextAuthor: "https://bla-bla.com"
        ]
        let format = UIGraphicsPDFRendererFormat()
        format.documentInfo = pdfMetaData as [String: Any]
        
        // MARK: - set page size
        let pageWidth = 8.5 * 72.0
        let pageHeight = 11 * 72.0
        let pageRect = CGRect(x: 0, y: 0, width: pageWidth, height: pageHeight)
        
        // MARK: - render
        let renderer = UIGraphicsPDFRenderer(bounds: pageRect, format: format)
        
        // MARK: - Attributes
        let CenteredParagraphStyle = NSMutableParagraphStyle()
        CenteredParagraphStyle.alignment = .center
        
        let TitleAttributes = [
            NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 36),
            NSAttributedString.Key.foregroundColor: UIColor.black
        ]
        
        let subTitleAtrributes = [
            NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 16),
            NSAttributedString.Key.foregroundColor: UIColor.black
        ]
        
        let timeAttrebutes = [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12),
            NSAttributedString.Key.foregroundColor: UIColor.gray,
            NSAttributedString.Key.paragraphStyle: CenteredParagraphStyle
        ]
        
        let generalAtrrebutes = [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12)
        ]
        
        // MARK: - texts
        let fusion = "FUSION TECH"
        let meetingRec = "MEETING RECAP"
        let membersTitle = "Members"
        let fusionSub = "Fusion"
        let disItemsTitle = "Discussion Items"
        let arrigmentsTitle = "Arrangements"
        let addInfo = "Additional Information"
        
        
        // MARK: - connect attributes with texts
        let attrebuttedFusionTitle = NSAttributedString(string: fusion, attributes: TitleAttributes)
        let attrebuttedMettingRec = NSAttributedString(string: meetingRec, attributes: TitleAttributes)
        let attrebuttedMembers = NSAttributedString(string: membersTitle, attributes: subTitleAtrributes)
        let attrebuttedFucionSub = NSAttributedString(string: fusionSub, attributes: subTitleAtrributes)
        let attrebuttedDisItemsTitle = NSAttributedString(string: disItemsTitle, attributes: subTitleAtrributes)
        let attrebuttedArrigmentsTitle = NSAttributedString(string: arrigmentsTitle, attributes: subTitleAtrributes)
        let attrebuttedDdInfoTitle = NSAttributedString(string: addInfo, attributes: subTitleAtrributes)
        
        let attrebuttedTime = NSAttributedString(string: formattedDate, attributes: timeAttrebutes)
        let attrebuttedClientComplany = NSAttributedString(string: clientCompanyName, attributes: subTitleAtrributes)
        let attrebuttedAdditionalInfo = NSAttributedString(string: additionalInfo ?? "No additioanl info", attributes: generalAtrrebutes)
        
        let attrebutedYourTeamsName = getNumereAttrebuttedStringArray(array: fusionMembers, attrebutes: generalAtrrebutes)
        let attrebuttedClientNames = getNumereAttrebuttedStringArray(array: clientTeam, attrebutes: generalAtrrebutes)
        let attrebuttedDisItems = getNumereAttrebuttedStringArray(array: discussionItems, attrebutes: generalAtrrebutes)
        let attrebuttedArrigments = getNumereAttrebuttedStringArray(array: arrigments, attrebutes: generalAtrrebutes)
        
        // MARK: - gradient
        let gradinetArray = [
            FIRST_LOGO_COLOR.cgColor,
            SECOND_LOGO_COLOR.cgColor,
            THRID_LOGO_COLOR.cgColor,
            FOURTH_LOGO_COLOR.cgColor,
            FIFTH_LOGO_COLOR.cgColor,
            SIXTH_LOGO_COLOR.cgColor,
        ]
        
        let cgGradient = CGGradient(
            colorsSpace: CGColorSpaceCreateDeviceRGB(),
            colors: gradinetArray as CFArray,
            locations:[0.0, 1.0])
        
        let data = renderer.pdfData { (context) in
            context.beginPage()
            let drawContext = context.cgContext
            // top titles
            attrebuttedFusionTitle.draw(at: CGPoint(x: 22, y: 25))
            attrebuttedTime.draw(in: CGRect(x: 452, y: 35, width: 118, height: 30))
            
            // top line
            drawTearOffs(drawContext, pageRect: pageRect, tearOffY: 75, end: pageRect.width - 22, cgGradient: cgGradient)
            
            // subTitles
            attrebuttedMettingRec.draw(at: CGPoint(x: 22, y: 83))
            
            // members section
            attrebuttedMembers.draw(at: CGPoint(x: 22, y: 155))
            
            drawTearOffs(drawContext, pageRect: pageRect, tearOffY: 185, end: pageRect.width - 273, cgGradient: cgGradient)
            
            attrebuttedFucionSub.draw(at: CGPoint(x: 32, y: 200))
            
            attrebuttedClientComplany.draw(at: CGPoint(x: pageWidth - 136, y: 200))
            
            drawList(array: attrebutedYourTeamsName, startX: 32, startY: 230)
            
            drawList(array: attrebuttedClientNames, startX: Int(pageWidth) - 128, startY: 230)
            
            // discussion items section
            
            attrebuttedDisItemsTitle.draw(at: CGPoint(x: 22, y: 300))
            
            drawTearOffs(drawContext, pageRect: pageRect, tearOffY: 330, end: pageRect.width - 273, cgGradient: cgGradient)
            
            drawList(array: attrebuttedDisItems, startX: 32, startY: 350)
            
            // arrigments section
            
            attrebuttedArrigmentsTitle.draw(at: CGPoint(x: 22, y: 445))
            
            drawTearOffs(drawContext, pageRect: pageRect, tearOffY: 475, end: pageRect.width - 273, cgGradient: cgGradient)
            
            drawList(array: attrebuttedArrigments, startX: 35, startY: 495)
            
            // additional info section
            
            attrebuttedDdInfoTitle.draw(at: CGPoint(x: 22, y: 590))
            
            drawTearOffs(drawContext, pageRect: pageRect, tearOffY: 620, end: pageRect.width - 273, cgGradient: cgGradient)
            
            attrebuttedAdditionalInfo.draw(at: CGPoint(x: 35, y: 640))
        }
        return data
    }
    
    private func drawList(array: [NSAttributedString], startX: Int, startY: Int) {
        array.enumerated().forEach { (index, item) in
            item.draw(at: CGPoint(x: startX, y: startY + (index * 20)))
        }
    }
    
    private func drawTearOffs(_ drawContext: CGContext, pageRect: CGRect, tearOffY: CGFloat, end: CGFloat, cgGradient: CGGradient?) {
        if let gradient = cgGradient {
            print("gradient \(gradient)")
            let layer = CGLayer(drawContext, size: CGSize(width: end, height: 4), auxiliaryInfo: nil);
            layer?.context!.drawLinearGradient(gradient, start: CGPoint(x: 0, y: 0), end: CGPoint(x: end, y: 4), options: []);
            return
        }
        drawContext.saveGState()
        drawContext.setLineWidth(4.0)
        
        drawContext.move(to: CGPoint(x: 22, y: tearOffY))
        drawContext.addLine(to: CGPoint(x: end, y: tearOffY))
        drawContext.setStrokeColor(CGColor(red: 189/255, green: 114/255, blue: 255/255, alpha: 1))
        drawContext.strokePath()
        drawContext.restoreGState()
    }
    
    private func getNumereAttrebuttedStringArray(
        array: [String],
        attrebutes: [NSAttributedString.Key : Any]?) -> [NSAttributedString] {
            return array.enumerated().map { (index, string) in
                NSAttributedString(string: "\(index + 1). \(string)", attributes: attrebutes)
            }
        }
}
