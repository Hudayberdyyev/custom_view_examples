//
//  KPRatingView.swift
//  custom_view_examples
//
//  Created by Ahmet Hudayberdyyev on 5/6/22.
//

import UIKit
import SnapKit

class KPRatingView: UIView {
    
    //MARK: -UIControls
    private let ratingLabel = KPRatingLabel()
    private let ratingGradientView = KPRatingGradientView()
    
    //MARK: -Initializers
    private func initialize() {
        print("KPRatingView => \(#function)")
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .clear
    }
    
    init() {
        print("KPRatingView => \(#function)")
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
    
    override func layoutSubviews() {
        super.layoutSubviews()
        print("KPRatingView => \(#function)")
    }
    
    //MARK: -View methods
    private func setupUI() {
        print("KPRatingView => \(#function)")
        addSubview(ratingGradientView)
        addSubview(ratingLabel)
        
        ratingGradientView.snp.makeConstraints { (make) in
            make.edges.equalTo(self)
        }
        ratingLabel.snp.makeConstraints { (make) in
            make.center.equalTo(ratingGradientView)
            make.edges.equalTo(ratingGradientView)
        }
    }
}

#if DEBUG
import SwiftUI

@available(iOS 13, *)
struct KPRatingViewPreview: PreviewProvider {
    
    static var previews: some View {
        // view controller using programmatic UI
        KPRatingView().toPreview()
    }
}
#endif
