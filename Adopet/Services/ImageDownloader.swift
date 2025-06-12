//
//  ImageDownloader.swift
//  Adopet
//
//  Created by Juliano Sgarbossa on 12/06/25.
//

import Foundation

class ImageDownloader {
    func downloadImage(from url: String, completion: @escaping (Data?) -> Void) {
        guard let url = URL(string: url) else {
            completion(nil)
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            if let data = data {
                completion(data)
            }
        }.resume()
    }
}
