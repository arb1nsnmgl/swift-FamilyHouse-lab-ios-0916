//
//  FilmLocationTableViewCell.swift
//  FamilyHouse
//
//  Created by Arvin San Miguel on 10/10/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class FilmLocationTableViewCell: UITableViewCell {

    @IBOutlet weak var filmNameLabel: UILabel!
    @IBOutlet weak var tvSeriesLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    
    var filmLocation: FilmLocation! {
        didSet { filmNameLabel.text = self.filmLocation.name
                 addressLabel.text = self.filmLocation.address
                 tvSeriesLabel.text = self.filmLocation.tvSeries.description
               }
    }
    
}
