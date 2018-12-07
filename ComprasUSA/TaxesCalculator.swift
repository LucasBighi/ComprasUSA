//
//  TaxesCalculator.swift
//  ComprasUSA
//
//  Created by Lucas Marques Bighi on 07/12/2018.
//  Copyright © 2018 Lucas Marques Bighi. All rights reserved.
//

import Foundation

class TaxesCalculator {
    static let shared = TaxesCalculator()
    
    var dolar: Double = 3.5
    var iof: Double = 6.38
    var stateTax: Double = 7.0
    var shoppingValue: Double = 0
    
    var formatter = NumberFormatter()
    
    var shoppingValueInReal: Double {
        return shoppingValue * dolar
    }
    
    var stateTaxValue: Double {
        return shoppingValue * stateTax / 100
    }
    
    var iofValue: Double {
        return (shoppingValue + stateTax) * iof / 100
    }
    
    func calculate(usingCreditCard: Bool) -> Double {
        var finalValue = shoppingValue + stateTax
        if usingCreditCard {
            finalValue += iofValue
        }
        return finalValue * dolar
    }
    
    func getFormattedValue(of value: Double, withCurrency currency: String) -> String {
        formatter.numberStyle = .currency
        formatter.currencySymbol = currency
        formatter.alwaysShowsDecimalSeparator = true
        return formatter.string(for: value)!
    }
    
    func convertToDouble(_ string: String) -> Double {
        formatter.numberStyle = .none
        return formatter.number(from: string)!.doubleValue
    }
    
    private init() {
        formatter.usesGroupingSeparator = true
        
    }
}
