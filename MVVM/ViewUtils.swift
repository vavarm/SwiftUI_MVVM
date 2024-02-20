//
//  ViewUtils.swift
//  MVVM
//
//  Created by Valentin Racaud--Minuzzi on 20/02/2024.
//

import SwiftUI

class ViewUtils {
    static let columns: [GridItem] = [GridItem](repeating: GridItem(.flexible(), spacing: 10, alignment: .leading), count: 2)
    
    static let currencyFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        return formatter
    }()
    
    static let salmon = Color(red: 1.0, green: 126.0/255.0, blue: 121.0/255.0)
    
    static func FormatDoubleToCurrencyString(_ value: Double) -> String {
        return String(format: "%.2f €",value)
    }
}
