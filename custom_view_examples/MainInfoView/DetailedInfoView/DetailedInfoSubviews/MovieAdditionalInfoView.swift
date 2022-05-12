//
//  MovieAdditionalInfoView.swift
//  custom_view_examples
//
//  Created by Ahmet Hudayberdyyev on 5/11/22.
//

import UIKit
import SnapKit

class MovieAdditionalInfoView: UIView {
    
    private let additionalInfoTextView = MovieAdditionalInfoTextView()
    
    //MARK: -Initializers
    private func initialize() {
        print("MovieAdditionalInfoView => \(#function)")
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .systemRed
    }
    
    init() {
        super.init(frame: .zero)
        print("MovieAdditionalInfoView => \(#function)")
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
        print("MovieAdditionalInfoView => \(#function)")
        addSubview(additionalInfoTextView)
        additionalInfoTextView.snp.makeConstraints { (make) in
            make.edges.equalTo(self)
        }
    }
    
}
