//
//  ExternalLinksHandler.swift
//  Adopet
//
//  Created by Juliano Sgarbossa on 12/06/25.
//

import UIKit

class ExternalLinksHandler {
    
    private var urlHandler = URLHandler()
    
    func openPhoneUrl(phoneNumber: String) {
        if let phoneUrl = URL(string: "tel://\(phoneNumber)") {
            urlHandler.openUrl(url: phoneUrl)
        }
    }
    
    func openWhatsappUrl(phoneNumber: String, message: String) {
        guard let whastappUrl = URL(string: "whatsapp://send?phone=\(phoneNumber)&text=\(message)") else { return }
        
        if urlHandler.canOpenUrl(url: whastappUrl) {
            urlHandler.openUrl(url: whastappUrl)
        } else {
            self.openWhatsappInAppStore()
        }
    }
    
    func openWhatsappInAppStore() {
        guard let appStoreUrl = URL(string: "https://apps.apple.com/app/whatsapp-messenger/id310633997") else { return }
        
        urlHandler.openUrl(url: appStoreUrl)
    }
}
