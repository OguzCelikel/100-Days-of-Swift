//
//  Petition.swift
//  Project7
//
//  Created by Ömer Oğuz Çelikel on 11.07.2022.
//

import Foundation

// decodable from JSON
struct Petition: Codable {
    var title: String
    var body: String
    var signatureCount: Int
}
