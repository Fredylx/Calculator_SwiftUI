//
//  CalculatorView.swift
//  Calculator
//
//  Created by Fredy lopez on 1/19/23.
//

import SwiftUI

// MARK: - BODY

struct CalculatorView: View {
    
    @EnvironmentObject private var viewModel: ViewModel
    
    var buttonTypes: [[ButtonType]] {
        [[.allClear, .negative, .percent, .operation(.division)],
         [.digit(.seven), .digit(.eight), .digit(.nine), .operation(.multiplication)],
         [.digit(.four), .digit(.five), .digit(.six), .operation(.subtraction)],
         [.digit(.zero), .decimal, .equals]]
    }
    
    var body: some View {
        VStack {
            Spacer()
            displayText
            buttonPad
        }
        .padding(Constants.padding)
        .background(Color.black)
    }
}
 // MARK: - PREVIEW

struct CalculatorView_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorView()
            .environmentObject(CalculatorView.ViewModel())
    }
}

// MARK: - COMPONENTS

extension CalculatorView {
    
    private var displayText: some View {
        Text(viewModel.displayText)
            .padding()
            .foregroundColor(.white)
            .frame(maxWidth: .infinity, alignment: .trailing)
            .font(.system(size: 88, weight: .light))
            .lineLimit(1)
            .minimumScaleFactor(0.2)
    }
    
    private var buttonPad: some View {
        GeometryReader { layout in
            VStack(spacing: Constants.padding) {
                ForEach(viewModel.buttonTypes, id: \.self) { row in
                    HStack(spacing: Constants.padding) {
                        ForEach(row, id: \.self) { buttonType in
                            CalculatorButton(size: layout.size, buttonType: buttonType)
                        }
                    }
                }
            }
        }
    }
    

}
