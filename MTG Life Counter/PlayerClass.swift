//
//  PlayerClass.swift
//  MTG Life Counter
//
//  Created by Enzo Agnoli on 7/17/17.
//  Copyright © 2017 Enzo Agnoli. All rights reserved.
//

import Foundation
class Player {
    var name : String
    var lifeTotal : Int = 0
    var poisonTotal : Int = 0
    var energyTotal : Int = 0
    var experienceTotal : Int = 0
    var previousLifeTotals : [Int] = []
    var previousPoisonTotals : [Int] = []
    var previousEnergyTotals : [Int] = []
    var previousExperienceTotals : [Int] = []
    var lifeHistoryStringArray : [String] = []
    var lifeHistory: String?
    var poisonHistoryStringArray : [String] = []
    var poisonHistory: String?
    var energyHistoryStringArray: [String] = []
    var energyHistory: String?
    var experienceHistoryStringArray: [String] = []
    var experienceHistory: String?
    init(name: String){
        self.name = name
    }
    
}
