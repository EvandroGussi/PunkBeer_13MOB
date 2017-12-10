//
//  Beer.swift
//  PunkBeer
//
//  Created by mac on 12/9/17.
//  Copyright © 2017 Evandro Gussi. All rights reserved.
//

import UIKit

class Beer {
    var id: Int
    var name: String
    var tagline: String
    var description: String
    var imageURL: String
    var abv: Float
    var ibu: Float
    
    init(id: Int, name: String, tagline: String, description: String, imageURL: String, abv: Float, ibu: Float) {
        self.id = id
        self.name = name
        self.tagline = tagline
        self.description = description
        self.imageURL = imageURL
        self.abv = abv
        self.ibu = ibu
    }
}
