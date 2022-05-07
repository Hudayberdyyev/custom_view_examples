//
//  FilmHighlightsView.swift
//  custom_view_examples
//
//  Created by Ahmet Hudayberdyyev on 5/6/22.
//

import UIKit
import SnapKit

class FilmHighlightsView: UIView {
    
    //MARK: -UIControls
    private let stackView = UIStackView()
    private let movieYearLabel = MovieYearLabel()
    private let movieAgeLabel = MovieAgeLabel()
    private let movieQualityLabel = MovieQualityLabel()
    private let movieKPRatingLabel = KPRatingView()
    private let movieImdbRatingLabel = ImdbRatingLabel()
    private let movieDurationLabel = MovieDurationLabel()
    
    //MARK: -Initializers
    private func initialize() {
        print("FilmHighlightsView => \(#function)")
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .systemRed
    }
    
    init() {
        print("FilmHighlightsView => \(#function)")
        super.init(frame: .zero)
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
    
    //MARK: -View methods
    private func setupUI() {
        print("FilmHighlightsView => \(#function)")
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        /// Add arranged subviews
        stackView.addArrangedSubview(movieYearLabel)
        stackView.addArrangedSubview(movieAgeLabel)
        stackView.addArrangedSubview(movieQualityLabel)
        stackView.addArrangedSubview(movieKPRatingLabel)
        stackView.addArrangedSubview(movieImdbRatingLabel)
        stackView.addArrangedSubview(movieDurationLabel)
        stackView.spacing = 10
        stackView.axis = .horizontal
        
        /// Set corner radius for each view
        stackView.arrangedSubviews.forEach({
            $0.clipsToBounds = true
            $0.layer.cornerRadius = 5
        })
        
        /// Add stack view
        addSubview(stackView)
        
        /// Set constraints
        stackView.snp.makeConstraints { (make) in
            make.edges.equalTo(self)
        }
    }
}

#if DEBUG
import SwiftUI

@available(iOS 13, *)
struct FilmHighlightsViewPreview: PreviewProvider {
    
    static var previews: some View {
        // view controller using programmatic UI
        FilmHighlightsView().toPreview()
    }
}
#endif
