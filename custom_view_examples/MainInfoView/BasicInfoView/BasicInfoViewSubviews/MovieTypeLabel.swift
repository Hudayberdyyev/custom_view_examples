//
//  MovieTypeLabel.swift
//  custom_view_examples
//
//  Created by Ahmet Hudayberdyyev on 5/6/22.
//

import UIKit

class MovieTypeLabel: UILabel {
    
    private func initialize() {
        print("MovieTypeLabel => \(#function)")
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .black
        font = UIFont(name: K.Fonts.robotoLight, size: Constants.basicMovieInfoView.baseInfoFont)
        textColor = .white
        textAlignment = .left
        text = "Serial"
    }
    
    init() {
        super.init(frame: .zero)
        print("MovieTypeLabel => \(#function)")
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
struct MovieTypeLabelPreview: PreviewProvider {
    
    static var previews: some View {
        // view controller using programmatic UI
        MovieTypeLabel().toPreview()
    }
}
#endif
