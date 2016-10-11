//
//  CharacterCollectionViewController.swift
//  FamilyHouse
//
//  Created by Arvin San Miguel on 10/10/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class CharacterCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var table = FilmLocationTableViewController()
    var characters: [Character]! { didSet { self.collectionView?.reloadData() } }
    var filmLocation: FilmLocation!
    var isSelected = false
    var selectedChar = [Character]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        self.navigationItem.title = "Characters"
        generateChar()
    }
    
    
    func generateChar() {
        
        characters = [
            Character(name: "Carl", realLifeName: "Reginald VelJohnson", tvSeries: .familyMatters, currentLocation: filmLocation, image: "carl".image ),
            Character(name: "Danny", realLifeName: "Bob Saget", tvSeries: .fullHouse, currentLocation: filmLocation, image: "danny".image),
            Character(name: "Dj", realLifeName: "Candace Cameron Bure", tvSeries: .fullHouse, currentLocation: filmLocation, image: "dj".image),
            Character(name: "Eddie", realLifeName: "Darius McCrary", tvSeries: .familyMatters, currentLocation: filmLocation, image: "eddie".image),
            Character(name: "Jesse", realLifeName: "John Stamos", tvSeries: .fullHouse, currentLocation: filmLocation, image: "jesse".image),
            Character(name: "Joey", realLifeName: "Dave Coulier", tvSeries: .fullHouse, currentLocation: filmLocation, image: "joey".image),
            Character(name: "Kimmy", realLifeName: "Andrea Barber", tvSeries: .fullHouse, currentLocation: filmLocation, image: "kimmy".image),
            Character(name: "Laura", realLifeName: "Kellie Williams", tvSeries: .familyMatters, currentLocation: filmLocation, image: "laura".image),
            Character(name: "Michelle", realLifeName: "Ashley Olsen", tvSeries: .fullHouse, currentLocation: filmLocation, image: "michelle".image),
            Character(name: "Rebecca", realLifeName: "Lori Loughlin", tvSeries: .fullHouse, currentLocation: filmLocation, image: "rebecca".image),
            Character(name: "Stephanie", realLifeName: "Jodie Sweetin", tvSeries: .fullHouse, currentLocation: filmLocation, image: "stephanie".image),
            Character(name: "Steve", realLifeName: "Jaleel White", tvSeries: .familyMatters, currentLocation: filmLocation, image: "steve".image),
            Character(name: "Waldo", realLifeName: "Shawn Harrison", tvSeries: .familyMatters, currentLocation: filmLocation, image: "waldo".image)
        ]
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return characters.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectCell", for: indexPath) as! CharacterCollectionViewCell
        cell.character = characters[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(top: 1.0, left: 1.0, bottom: 1.0, right: 1.0)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width / 3 - 2
        return CGSize(width: width, height: width)
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! CharacterCollectionViewCell
        
        if isSelected {
            cell.characterImageView.alpha = 1.0
            isSelected = false
            selectedChar = selectedChar.filter({ $0.name != cell.character.name })
        } else {
            cell.characterImageView.alpha = 0.5
            isSelected = true
            selectedChar.append(cell.character)
        }
        
    }
    
    @IBAction func doneButtonTapped(_ sender: UIBarButtonItem!) {
        
        evaluateCast()
        selectedChar = []
        characters = []
        navigationController?.popViewController(animated: true)
        
    }
    
    func evaluateCast() {
        for char in selectedChar {
            if char.tvSeries.description == filmLocation.tvSeries.description {
                print("\(char.name)!, You're allowed in the set!")
            } else {
                print("\(char.name), You're not going anywhere!")
            }
        }
    }
}

extension String {
    var image: UIImage { return UIImage(named: "\(self.lowercased())")! }
}


