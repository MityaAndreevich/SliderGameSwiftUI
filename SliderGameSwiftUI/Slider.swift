//
//  Slider.swift
//  SliderGameSwiftUI
//
//  Created by Dmitry Logachev on 09.11.2021.
//

import SwiftUI

struct Slider: UIViewRepresentable {
    
    @Binding var sliderValue: Double
    
    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider()
        slider.maximumValue = 100
        slider.minimumValue = 0
        slider.thumbTintColor = .red
        slider.value = Float(sliderValue)
        slider.addTarget(
            context.coordinator,
            action: #selector(Coordinator.sliderMoved),
            for: .valueChanged
        )
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.value = Float(sliderValue)
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(sliderValue: $sliderValue)
    }
}

extension Slider {
    class Coordinator: NSObject {
        @Binding var sliderValue: Double
        
        init(sliderValue: Binding<Double>) {
            self._sliderValue = sliderValue
        }
        
        @objc func sliderMoved(_ sender: UISlider) {
            sliderValue = Double(sender.value)
        }
    }
}

struct Slider_Previews: PreviewProvider {
    static var previews: some View {
        Slider(sliderValue: .constant(10))
    }
}
