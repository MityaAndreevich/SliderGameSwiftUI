//
//  ButtonView.swift
//  SliderGameSwiftUI
//
//  Created by Dmitry Logachev on 09.11.2021.
//

import SwiftUI
struct ButtonView: View {
    
    let buttonTitle: String
    let action: () -> Void
    
    var body: some View {
        Button(action: { action() }) {
            Text(buttonTitle)
        }
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(buttonTitle: "Action", action: {})
    }
}
