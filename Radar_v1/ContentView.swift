//
//  ContentView.swift
//  Radar_v1
//
//  Created by Viettasc on 11/6/19.
//  Copyright © 2019 Viettasc. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var isSpinning = false
    @State public var first = true
    
    struct Radar: Identifiable {
        var id = UUID().uuidString
        var name: String
        var degrees: Double
    }
    
    let radars = [Radar(name: "outer", degrees: -180), Radar(name: "inner", degrees: 180)]
    
    var backgroundView: some View {
        RadialGradient(gradient: Gradient(colors: [Color.white, .blue]), center: .center, startRadius: 5, endRadius: 500)
        .scaleEffect(1.2)
    }
    
    var radarView: some View {
        ForEach(radars) {
            Image($0.name)
                .rotationEffect(.degrees(self.isSpinning ? $0.degrees : 0))
                .animation(Animation.easeOut(duration: 1).repeatForever(autoreverses: true))
                .onAppear {
                    if self.first {
                        self.first = false
                        self.isSpinning.toggle()
                    }
            }
        }
    }
    
    var body: some View {
        ZStack {
            backgroundView
            radarView
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
