//
//  MovieTitleLabel.swift
//  custom_view_examples
//
//  Created by Ahmet Hudayberdyyev on 5/6/22.
//

import UIKit

class MovieTitleLabel: UILabel {
    
    private func initialize() {
        print("MovieTitleLabel => \(#function)")
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .black
        font = UIFont(name: K.Fonts.robotoMedium, size: Constants.basicMovieInfoView.titleFont)
        textColor = .white
        textAlignment = .center
        text = "The Imitation Game"
    }
    
    init() {
        super.init(frame: .zero)
        print("MovieTitleLabel => \(#function)")
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
struct MovieTitleLabelPreview: PreviewProvider {
    
    static var previews: some View {
        // view controller using programmatic UI
        MovieTitleLabel().toPreview()
    }
}
#endif
