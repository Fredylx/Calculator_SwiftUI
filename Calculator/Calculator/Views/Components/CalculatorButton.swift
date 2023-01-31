//
//  CalculatorButton.swift
//  Calculator
//
//  Created by Fredy lopez on 1/19/23.
//
//
//
//



import SwiftUI

extension CalculatorView {
    struct CalculatorButton: View {
        let size: CGSize
        let buttonType: ButtonType
        @EnvironmentObject private var viewModel: ViewModel
        
        var body: some View {
            Button(buttonType.description) {
                viewModel.performAction(for: buttonType)
            }
            .buttonStyle(CalculatorButtonStyle(
                    size: getButtonSize(),
                    backgroundColor: getBackgroundColor(),
                    foregroundColor: getForegroundColor(),
                    isWide: buttonType == .digit(.zero))
                            
                )
        }
        
        // MARK: - HELPERS
    
        private func getButtonSize() -> CGSize {
            let screenWidth = size.width
            let buttonCount: CGFloat = 4.0
//            return CGSize(width: (screenWidth - (spacingCount * Constants.padding)) / buttonCount, height: size.height / 6)
            return CGSize(width: (screenWidth / buttonCount) - (Constants.padding), height: size.height / 6)
        }
        
        private func getBackgroundColor() -> Color {
            return viewModel.buttonTypeIsHighlighted(buttonType: buttonType) ? buttonType.foregroundColor : buttonType.backgroundColor
        }

        private func getForegroundColor() -> Color {
            return viewModel.buttonTypeIsHighlighted(buttonType: buttonType) ? buttonType.backgroundColor : buttonType.foregroundColor
        }
    }
}


struct CalculatorView_CalculatorButton_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorView.CalculatorButton(size: .zero, buttonType: .digit(.zero))
    }
}


