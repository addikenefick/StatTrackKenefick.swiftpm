//
//  PracticeView.swift
//  StatTrackKenefick
//
//  Created by ADDISON KENEFICK on 11/14/25.
//

import SwiftUI
import SwiftData
struct PracticeView: View {
    var thisPractice: Practice
    
    var body: some View {
        VStack {
            Text("Practice Summary")
                .font(.title2)
                .bold()

            Text("Hits: \(thisPractice.hits)")
            Text("Total: \(thisPractice.total)")
            Text("Percent: \(thisPractice.percent, specifier: "%.1f")%")
                .padding()
                .background(Color("newPink").opacity(0.2))
                .clipShape(RoundedRectangle(cornerRadius: 12))

            Spacer()
        }
        .padding()
    }
}
