//
//  CardsCollectionViewController.swift
//  StarWarsCardGame
//
//  Created by Ben Erekson on 7/22/21.
//

import UIKit


class CardsCollectionViewController: UICollectionViewController {
    
    //MARK: - Properties
    var personaCards: [Persona] = []
    var factionIsJedi: Bool = true
    var targetPersona: Persona?
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        shuffleCards()
        updateViews()
    }
    
    //MARK: - Methods
    func shuffleCards(){
        // grab 3 of one faction and 1 of other (random)
        //append those to personaCards
        //set the targetCheracter
        
        personaCards.removeAll()
        
        var targetFaction: [Persona] = []
        var offTargetPersona: Persona?
        
        if factionIsJedi {
            
            targetFaction = Array(PersonaController.jedi.shuffled().prefix(3))
            offTargetPersona = PersonaController.sith.randomElement()
            targetFaction = targetFaction.shuffled()
            
            personaCards.append(contentsOf: targetFaction)
            
            targetPersona = personaCards.randomElement()
            
            if let offTargetPersona = offTargetPersona {
                personaCards.append(offTargetPersona)
            }
            
            personaCards = personaCards.shuffled()
            
        }else{
            targetFaction = Array(PersonaController.sith.shuffled().prefix(3))
            offTargetPersona = PersonaController.jedi.randomElement()
            targetFaction = targetFaction.shuffled()
            
            personaCards.append(contentsOf: targetFaction)
            
            targetPersona = personaCards.randomElement()
            
            if let offTargetPersona = offTargetPersona {
                personaCards.append(offTargetPersona)
            }
            
            personaCards = personaCards.shuffled()
            
        }
    }
    
    func updateViews(){
        title = "Find \(targetPersona?.name ?? "unknown")"
        presentingViewController?.title = title
        collectionView.reloadData()
    }

    // MARK: UICollectionViewDataSource
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "personaCell", for: indexPath) as? personaCollectionViewCell else {return UICollectionViewCell()}
        
        cell.displayImageFor(persona: personaCards[indexPath.row])
        
        return cell
    }
    // MARK: UICollectionViewDelegate
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            presentResultAlert(isCorrect: personaCards[indexPath.row] == targetPersona)
    }
    
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

extension CardsCollectionViewController {
    func presentResultAlert(isCorrect: Bool){
        
        var title: String = ""
        
        let correctAnswers = [
        "The force is strong with this one",
        "Master yoda approves",
        "Good job youngling",
        "You did it!",
        "Yay! you guessed right!"
        ]
        
        let incorrectAnswers = [
            "Do or do not there is not try.",
            "You Failed! (That was an easy one to!)",
            "Well crap.",
            "Well here we are again!",
            "... This is akward."
        ]
        
        if isCorrect {
            title = correctAnswers.randomElement() ?? "Good Job!"
        } else {
            title = incorrectAnswers.randomElement() ?? "Nope."
        }
        
        let alert = UIAlertController(title: title, message: "Play again?", preferredStyle: .alert)
        
        let shuffle = UIAlertAction(title: "Yes", style: .default) { _ in
            self.shuffleCards()
            self.updateViews()
        }
        let no = UIAlertAction(title: "No", style: .cancel) { _ in
            exit(0)
        }
        alert.addAction(shuffle)
        alert.addAction(no)
        present(alert, animated: true, completion: nil)
    }
}

//MARK: - filter view controller delegate methods
extension CardsCollectionViewController: FilterviewControllerDelegate {
    func updateFaction(isJedi: Bool) {
        factionIsJedi = isJedi
        shuffleCards()
        updateViews()
    }
    
    
}

//MARK: - Navigation

extension CardsCollectionViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as? FilterViewController
        destination?.delegate = self
    }
}
