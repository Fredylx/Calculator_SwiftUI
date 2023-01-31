//
//  ButtonType.swift
//  Calculator
//
//  Created by Fredy lopez on 1/19/23.
//

import Foundation
import SwiftUI

enum ButtonType: Hashable, CustomStringConvertible {
    case equals
    case decimal
    case percent
    case negative
    case allClear
    case clear
    case digit(_ digit: Digit)
    case operation(_ operation: ArithmeticOperation)
    
    var description: String {
        switch self {
        case.digit(let digit):
            return digit.description
        case .operation(let operation):
            return operation.description
        case .negative:
            return "-/+"
        case .percent:
            return "%"
        case .equals:
            return "="
        case .allClear:
            return "AC"
        case .clear:
            return "C"
        case .decimal:
            return "."
        }
    }
    
    var backgroundColor: Color {
        switch self {
        case .allClear, .clear, .negative, .percent:
            return Color(red: 0.094, green: 0.235, blue: 0.157)
        case .operation, .equals:
            return Color(.darkGray)
        case .digit:
            return .secondary
        case .decimal:
            return Color (red: 0.969, green: 0.906, blue: 0.808)
        }
    }
        
    var foregroundColor: Color {
        switch self {
        case .allClear, .clear, .negative, .percent:
            return.black
        default:
            return .white
        }
    }
    
    
        
        
}
