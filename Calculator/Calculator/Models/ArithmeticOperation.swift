//
//  ArithmeticOperation.swift
//  Calculator
//
//  Created by Fredy lopez on 1/19/23.
//

import Foundation

enum ArithmeticOperation: CaseIterable, CustomStringConvertible {
    case addition, subtraction, multiplication, division
    
    var description: String {
        switch self {
        case .addition:
            return "+"
        case .subtraction:
            return "-"
        case .multiplication:
            return "x"
        case .division:
            return "/"
            
        }
    }
}

