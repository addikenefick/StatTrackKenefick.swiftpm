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
    var skills = [""]
    var practices: [String] = []
    init(teamName: String, teamLevel: String) {
        self.teamName = teamName
        self.teamLevel = teamLevel
    }
}
