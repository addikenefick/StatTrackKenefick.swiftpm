//
//  File.swift
//  StatTrackKenefick
//
//  Created by ADDISON KENEFICK on 10/31/25.
//
import SwiftData
@Model
class Routine {
    var teamName: String
    var teamLevel: String
    var skills: [String] = []
    var practices: [Practice] = []
    var theseHits: Int = 0
    var thisPercent: Double = 0.0
  
    init(teamName: String, teamLevel: String) {
        self.teamName = teamName
        self.teamLevel = teamLevel
    }
}
