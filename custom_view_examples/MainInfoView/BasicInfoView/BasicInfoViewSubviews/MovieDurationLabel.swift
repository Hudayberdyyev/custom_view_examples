//
//  MovieDurationLabel.swift
//  custom_view_examples
//
//  Created by Ahmet Hudayberdyyev on 5/6/22.
//

import UIKit

@IBDesignable class MovieDurationLabel: UILabel {
    
    //MARK: -EdgeInsets
    @IBInspectable var topInset: CGFloat = Constants.basicMovieInfoView.filmHighlightsVerticalEdgeInsets
    @IBInspectable var bottomInset: CGFloat = Constants.basicMovieInfoView.filmHighlightsVerticalEdgeInsets
    @IBInspectable var leftInset: CGFloat = Constants.basicMovieInfoView.filmHighlightsHorizontalEdgeInsets
    @IBInspectable var rightInset: CGFloat = Constants.basicMovieInfoView.filmHighlightsHorizontalEdgeInsets
    
    override func drawText(in rect: CGRect) {
        let insets = UIEdgeInsets(top: topInset, left: leftInset, bottom: bottomInset, right: rightInset)
        super.drawText(in: rect.inset(by: insets))
    }
    
    override var intrinsicContentSize: CGSize {
        let size = super.intrinsicContentSize
        return CGSize(width: size.width + leftInset + rightInset,
                      height: size.height + topInset + bottomInset)
    }
    
    override var bounds: CGRect {
        didSet {
            // ensures this works within stack views if multi-line
            preferredMaxLayoutWidth = bounds.width - (leftInset + rightInset)
        }
    }
    
    //MARK: -Initializers
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
