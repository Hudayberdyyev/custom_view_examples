//
//  MovieDurationLabel.swift
//  custom_view_examples
//
//  Created by Ahmet Hudayberdyyev on 5/6/22.
//

import UIKit

class MovieDurationLabel: UILabel {
    
    private func initialize() {
        print("MovieDurationLabel => \(#function)")
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .black
        font = UIFont(name: K.Fonts.robotoLight, size: Constants.basicMovieInfoView.baseInfoFont)
        textColor = .white
        textAlignment = .center
        text = "8 sezon"
    }
    
    init() {
        super.init(frame: .zero)
        print("MovieDurationLabel => \(#function)")
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
struct MovieDurationLabelPreview: PreviewProvider {
    
    static var previews: some View {
        // view controller using programmatic UI
        MovieDurationLabel().toPreview()
    }
}
#endif
