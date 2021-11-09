//
//  ContentView.swift
//  SliderGameSwiftUI
//
//  Created by Dmitry Logachev on 09.11.2021.
//

import SwiftUI

struct ContentView: View {
    @State private var currentValue: Double = 50
    @State private var targetValue = Int.random(in: 0...100)
    
    @State private var alertPresenter = false
    var body: some View {
        VStack {
                Text("Move slider as much closer to \(targetValue) as possible")
                .frame(width: 250, height: 45)
                .padding()
            HStack{
                Text("0")
                    .frame(width: 60, height: 20)
                Text("100")
                    .frame(width: 60, height: 20)
            }
            ButtonView(buttonTitle: "Check me!", action: { alertPresenter.toggle() })
                .alert("Your score:", isPresented: $alertPresenter, actions: {}) {
                    Text("\(computeScore())")
                }
            ButtonView(buttonTitle: "Restart", action: restartingGame)
        }
        .padding()
    }
    
private func computeScore() -> Int {
    let difference = Int(abs(targetValue - lround(currentValue)))
    let score = 100 - difference
    return score
}
    
    private func restartingGame() {
        targetValue = Int.random(in: 0...100)
        currentValue = 50
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

