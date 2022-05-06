//
//  ImdbRatingLabel.swift
//  custom_view_examples
//
//  Created by Ahmet Hudayberdyyev on 5/6/22.
//

import UIKit

class ImdbRatingLabel: UILabel {
    
    private func initialize() {
        print("ImdbRatingLabel => \(#function)")
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = #colorLiteral(red: 0.961797297, green: 0.7777594328, blue: 0.07130443305, alpha: 1)
        font = UIFont(name: K.Fonts.robotoLight, size: Constants.basicMovieInfoView.baseInfoFont)
        textColor = .black
        textAlignment = .center
        text = "8.0"
    }
    
    init() {
        super.init(frame: .zero)
        print("ImdbRatingLabel => \(#function)")
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
struct ImdbRatingLabelPreview: PreviewProvider {
    
    static var previews: some View {
        // view controller using programmatic UI
        ImdbRatingLabel().toPreview()
    }
}
#endif
