//
//  Persona.swift
//  StarWarsCardGame
//
//  Created by Ben Erekson on 7/22/21.
//

import Foundation
import UIKit

class Persona {
    let name: String
    let faction: String
    let photo: UIImage?
    
    init(name: String, photo: UIImage?, faction: String){
        self.name = name
        self.faction = faction
        self.photo = photo
    }
    
}
