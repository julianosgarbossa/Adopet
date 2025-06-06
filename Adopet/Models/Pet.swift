//
//  Pet.swift
//  Adopet
//
//  Created by Giovanna Moeller on 13/02/24.
//

import Foundation

struct Pet: Decodable {
    let name: String
    let imageUrl: String
    let age: String
    let behavior: String
    let size: String
    let location: String
    let phoneNumber: String
}
