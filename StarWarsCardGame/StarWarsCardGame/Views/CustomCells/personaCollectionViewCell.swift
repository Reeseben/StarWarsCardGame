//
//  personaCollectionViewCell.swift
//  StarWarsCardGame
//
//  Created by Ben Erekson on 7/22/21.
//

import UIKit

class personaCollectionViewCell: UICollectionViewCell {
    
    //MARK: - IBOutlets
    @IBOutlet weak var personaImageview: UIImageView!
    
    //MARK: - Functions
    func displayImageFor(persona: Persona){
        personaImageview.image = persona.photo
        personaImageview.contentMode = .scaleAspectFill
    }
    
    //MARK: - Actions
    
}
