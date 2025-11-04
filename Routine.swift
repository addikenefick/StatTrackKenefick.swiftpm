//
//  File.swift
//  StatTrackKenefick
//
//  Created by ADDISON KENEFICK on 10/31/25.
//



class Routine{
    var teamName: String
    var teamLevel: Int
    var teamStunts: [String] = []
    var teamTumbling: [String] = []
    init(teamName: String, teamLevel: Int) {
        self.teamName = teamName
        self.teamLevel = teamLevel
    }
}
