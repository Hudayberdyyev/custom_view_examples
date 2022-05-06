//
//  Extensions.swift
//  custom_view_examples
//
//  Created by Ahmet Hudayberdyyev on 5/6/22.
//

import UIKit

extension Double {
    var screenMaxDimensionRelativeValue: Double {
        let newValue = self * Double(max(UIScreen.main.bounds.height, UIScreen.main.bounds.width))
        return newValue
    }
    
    var screenMinDimensionRelativeValue: Double {
        let newValue = self * Double(min(UIScreen.main.bounds.height, UIScreen.main.bounds.width))
        return newValue
    }
}
