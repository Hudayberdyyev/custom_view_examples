//
//  MovieAgeLabel.swift
//  custom_view_examples
//
//  Created by Ahmet Hudayberdyyev on 5/6/22.
//

import UIKit

class MovieAgeLabel: UILabel {
    
    private func initialize() {
        print("MovieAgeLabel => \(#function)")
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = #colorLiteral(red: 0.2391854823, green: 0.2392330766, blue: 0.2391824722, alpha: 1)
        font = UIFont(name: K.Fonts.robotoLight, size: Constants.basicMovieInfoView.baseInfoFont)
        textColor = .white
        textAlignment = .center
        text = "6+"
    }
    
    init() {
        super.init(frame: .zero)
        print("MovieAgeLabel => \(#function)")
        initialize()
    }
    
    @available (*, unavailable)
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    @available (*, unavailable)
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

#if DEBUG
import SwiftUI

@available(iOS 13, *)
struct MovieAgeLabelPreview: PreviewProvider {
    
    static var previews: some View {
        // view controller using programmatic UI
        MovieAgeLabel().toPreview()
    }
}
#endif
