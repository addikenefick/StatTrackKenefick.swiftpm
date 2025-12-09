//
//  Practice.swift
//  StatTrackKenefick
//
//  Created by ADDISON KENEFICK on 11/20/25.
//

import Foundation
import SwiftData
@Model
class Practice {
    var hits: Int
    var total: Int
    var percent: Double
    var practiceDay = Date()
    init(hits: Int, total: Int, percent: Double) {
        self.hits = hits
        self.total = total
        self.percent = percent
      
    }
}
