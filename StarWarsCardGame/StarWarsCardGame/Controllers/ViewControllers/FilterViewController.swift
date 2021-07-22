//
//  FilterViewController.swift
//  StarWarsCardGame
//
//  Created by Ben Erekson on 7/22/21.
//

import UIKit

protocol FilterviewControllerDelegate: AnyObject {
    func updateFaction(isJedi: Bool)
}

class FilterViewController: UIViewController {

    //MARK: - Properties
    weak var delegate: FilterviewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
 
    //MARK: - Actions
    @IBAction func SithButtonTapped(_ sender: Any) {
        delegate?.updateFaction(isJedi: false)
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func JediButtonTapped(_ sender: Any) {
        delegate?.updateFaction(isJedi: true)
        dismiss(animated: true, completion: nil)
    }
    
}
