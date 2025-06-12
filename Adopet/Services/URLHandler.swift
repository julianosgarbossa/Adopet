//
//  URLHandler.swift
//  Adopet
//
//  Created by Juliano Sgarbossa on 12/06/25.
//

import UIKit

class URLHandler {
    func openUrl(url: URL,
                 options: [UIApplication.OpenExternalURLOptionsKey : Any] = [:],
                 completionHandler: ((Bool) -> Void)? = nil) {
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
    
    func canOpenUrl(url: URL) -> Bool {
        return UIApplication.shared.canOpenURL(url)
    }
}
