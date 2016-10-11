//
//  FilmLocationTableViewController.swift
//  FamilyHouse
//
//  Created by Arvin San Miguel on 10/10/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class FilmLocationTableViewController: UITableViewController {

    var filmLocations: [FilmLocation]! { didSet { self.tableView.reloadData() } }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        generateLocations()
    }
    
    func generateLocations() {
        filmLocations = [FilmLocation(name: "Hollywood", address: "Manhattan", tvSeries: .fullHouse),
                        FilmLocation(name: "Universal", address: "Florida", tvSeries: .fullHouse),
                        FilmLocation(name: "Silver Cup", address: "Astoria", tvSeries: .familyMatters),
                        FilmLocation(name: "Miami", address: "Florida", tvSeries: .familyMatters)]
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filmLocations.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "seriesCell", for: indexPath) as! FilmLocationTableViewCell
        let filmLocation = filmLocations[indexPath.row]
        cell.filmLocation = filmLocation
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier != "toCollectionVC" { return }
        
        if let dest = segue.destination as? CharacterCollectionViewController,
            let indexPath = tableView.indexPathForSelectedRow {
            dest.filmLocation = filmLocations[indexPath.row]
        }
        
    }
    
}
