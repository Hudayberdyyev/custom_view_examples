//
//  KPRatingLabel.swift
//  custom_view_examples
//
//  Created by Ahmet Hudayberdyyev on 5/6/22.
//

import UIKit

class KPRatingLabel: UILabel {
    
    //MARK: -Initializers
    private func initialize() {
        print("KPRatingLabel => \(#function)")
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .clear
        font = UIFont(name: K.Fonts.robotoLight, size: Constants.basicMovieInfoView.baseInfoFont)
        textColor = .white
        textAlignment = .center
        text = "7.4"
    }
    
    init() {
        super.init(frame: .zero)
        print("KPRatingLabel => \(#function)")
        initialize()
        setupUI()
    }
    
    @available (*, unavailable)
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    @available (*, unavailable)
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    //MARK: -Layer methods
    
    private func setupUI() {
        print("KPRatingLabel => \(#function)")
    }
}

#if DEBUG
import SwiftUI

@available(iOS 13, *)
struct KPRatingLabelPreview: PreviewProvider {
    
    static var previews: some View {
        // view controller using programmatic UI
        KPRatingLabel().toPreview()
    }
}
#endif
