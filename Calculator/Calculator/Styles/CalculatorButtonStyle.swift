//
//  CalculatorButtonStyle.swift
//  Calculator
//
//  Created by Fredy lopez on 1/19/23.
//

import SwiftUI

struct CalculatorButtonStyle: ButtonStyle {
    static let x: Int = 5
    var size: CGSize //Core graphics give width and height of the screen
    var backgroundColor: Color
    var foregroundColor: Color
    var isWide: Bool = false
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.system(size: 32, weight: .medium))
            .frame(width: size.width, height: size.height)
            .frame(maxWidth: isWide ? (size.width * 2) + Constants.padding : size.width, alignment: .center)
            .background(backgroundColor)
            .foregroundColor(foregroundColor)
            .overlay {
                if configuration.isPressed {
                    Color(white: 1.0, opacity: 0.2)
                }
            }
//            .clipShape(Capsule())
            .cornerRadius(30)
    }
}

struct CalculatorButtonStyle_Previews: PreviewProvider {
    static let buttonType: ButtonType = .digit(.zero)
    
    static var previews: some View {
        return Button(buttonType.description) { }
            .buttonStyle(CalculatorButtonStyle(size: .zero,
                                               backgroundColor: buttonType.backgroundColor,
                                               foregroundColor: buttonType.foregroundColor))
    }
}

//struct Car {
//    static let numberOfWheels: Int = 4
//    var color: Color?
//}
