//
//  Constants.swift
//  custom_view_examples
//
//  Created by Ahmet Hudayberdyyev on 5/6/22.
//

import UIKit

struct Constants {
    struct basicMovieInfoView {
        static let titleFont: CGFloat = CGFloat(0.035.screenMaxDimensionRelativeValue)
        static let baseInfoFont: CGFloat = CGFloat(0.020.screenMaxDimensionRelativeValue)
        static let filmHighlightsHorizontalEdgeInsets: CGFloat = 5
        static let filmHighlightsVerticalEdgeInsets: CGFloat = 3
    }
}

struct K {
    struct Fonts {
        static let robotoLight = "Roboto-Light"
        static let robotoMedium = "Roboto-Medium"
        static let robotoThin = "Roboto-Thin"
    }
}

struct ColorPalette {
    struct Blue {
        static let Light = #colorLiteral(red: 0.1432349086, green: 0.5036785603, blue: 0.910633266, alpha: 1)
        static let Medium = #colorLiteral(red: 0.1067495719, green: 0.3233799934, blue: 0.5766439438, alpha: 1)
        static let Dark = #colorLiteral(red: 0, green: 0.09160999209, blue: 0.2834234536, alpha: 1)
    }
    
    static let White = UIColor.white
    
    struct SkeletonColors {
        static let Primary = #colorLiteral(red: 0.1097869948, green: 0.1098136529, blue: 0.1097853258, alpha: 1)
        static let Secondary = #colorLiteral(red: 0.1333139837, green: 0.1333444417, blue: 0.1333120763, alpha: 1)
    }
}

