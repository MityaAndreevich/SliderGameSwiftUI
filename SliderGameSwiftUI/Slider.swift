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
        
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        
    }
}


struct Slider_Previews: PreviewProvider {
    static var previews: some View {
        Slider(sliderValue: .constant(10))
    }
}
