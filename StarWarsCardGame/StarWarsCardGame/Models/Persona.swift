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
extension Persona: Equatable{
    static func == (lhs: Persona, rhs: Persona) -> Bool {
        return lhs.faction == rhs.faction && lhs.name == rhs.name && lhs.photo == rhs.photo
    }
    
    
}
