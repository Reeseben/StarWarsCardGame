//
//  CardsCollectionViewController.swift
//  StarWarsCardGame
//
//  Created by Ben Erekson on 7/22/21.
//

import UIKit


class CardsCollectionViewController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "personaCell", for: indexPath)
        
        if indexPath.row % 2 == 0 && indexPath.section % 2 == 0{
            cell.backgroundColor = .blue
        } else if indexPath.row % 2 != 0 && indexPath.section % 2 == 0 {
            cell.backgroundColor = .gray
        } else if indexPath.row % 2 != 0 && indexPath.section % 2 != 0{
            cell.backgroundColor = .blue
        } else {
            cell.backgroundColor = .gray
        }
    
        return cell
    }

    // MARK: UICollectionViewDelegate
    

}

//MARK: - Collection view flow layout delegate methods
extension CardsCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = view.frame.width * 0.45
        
        return CGSize(width: width, height: width * 4 / 3)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        let width = view.frame.width * 0.45
        
        let cellTotalWidth = width * 2
        
        let leftoverWidth = view.frame.width - cellTotalWidth
        
        let inset = leftoverWidth / 3
        
        return UIEdgeInsets(top: inset, left: inset, bottom: 0, right: inset)
    }
}
