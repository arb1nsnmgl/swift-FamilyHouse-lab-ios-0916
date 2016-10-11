//
//  FamilyHouse.swift
//  FamilyHouse
//
//  Created by Arvin San Miguel on 10/10/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation
import UIKit

enum TVSeries {
    
    case familyMatters
    case fullHouse
    
    var description: String { if self == .familyMatters { return "Family Matters" } else { return "Full House" } }
    
}

struct FilmLocation {
    
    let name: String
    let address: String
    var tvSeries: TVSeries
    
    init(name: String, address: String, tvSeries: TVSeries) {
        self.name = name
        self.address = address
        self.tvSeries = tvSeries
    }
}

struct Character {
    
    let name: String
    let realLifeName: String
    let tvSeries: TVSeries
    var currentLocation: FilmLocation
    let image: UIImage
    
    init(name: String, realLifeName: String, tvSeries: TVSeries, currentLocation: FilmLocation, image: UIImage) {
        self.name = name
        self.realLifeName = realLifeName
        self.tvSeries = tvSeries
        self.currentLocation = currentLocation
        self.image = image
    }
    
    func canReportToSet(on location: FilmLocation) -> Bool {
        return location.tvSeries == self.tvSeries
    }
    
    mutating func reportToSet(on location: FilmLocation) {
        if canReportToSet(on: location) { currentLocation = location }
    }
    
}
