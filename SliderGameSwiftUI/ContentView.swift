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
                .frame(height: 45)
                .lineLimit(1)
                .padding()
            HStack{
                Text("0")
                    .frame(width: 60, height: 20)
                Slider(sliderValue: $currentValue, opacity: getOpacity())
                Text("100")
                    .frame(width: 60, height: 20)
            }
            Spacer()
            ButtonView(buttonTitle: "Check me!", action: { alertPresenter.toggle() })
                .alert("Your score:", isPresented: $alertPresenter, actions: {}) {
                    Text("\(computeScore())")
                }
                .padding()
            ButtonView(buttonTitle: "Restart", action: restartingGame)
        }
        .padding(.top, 150)
        .padding(.bottom, 50)
    }
    
    private func computeScore() -> Int {
        let difference = abs(targetValue - lround(currentValue))
        return 100 - difference
    }
    
    private func getOpacity() -> CGFloat {
        let difference = abs(targetValue - lround(currentValue))
        return (100 - CGFloat(difference)) / 100
    }
    
    private func restartingGame() {
        targetValue = Int.random(in: 0...100)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

