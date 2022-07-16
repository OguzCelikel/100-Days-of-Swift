//
//  Person.swift
//  Project10
//
//  Created by Ömer Oğuz Çelikel on 16.07.2022.
//

import UIKit

class Person: NSObject {
    var name: String
    var image: String
    
    init(name: String, image: String) {
        self.name = name
        self.image = image
    }
}
