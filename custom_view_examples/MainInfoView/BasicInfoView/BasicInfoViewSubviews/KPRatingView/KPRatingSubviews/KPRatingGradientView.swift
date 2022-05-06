//
//  KPRatingView.swift
//  custom_view_examples
//
//  Created by Ahmet Hudayberdyyev on 5/6/22.
//

import UIKit

class KPRatingGradientView: UIView {
    
    //MARK: -UIControls
    private var gradientLayer: CAGradientLayer = {
        let layer = CAGradientLayer()
        return layer
    }()
    
    //MARK: -Initializers
    private func initialize() {
        print("KPRatingGradientView => \(#function)")
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .clear
    }
    
    init() {
        print("KPRatingGradientView => \(#function)")
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
        gradientLayer.frame = self.bounds
    }
    
    //MARK: -View methods
    private func setupUI() {
        print("KPRatingGradientView => \(#function)")
        
        gradientLayer.frame = bounds
        gradientLayer.colors = []
        
        let colors = [#colorLiteral(red: 0.732937634, green: 0.07044992596, blue: 0.6783198118, alpha: 1), #colorLiteral(red: 0.9525786042, green: 0.5904087424, blue: 0.1977606118, alpha: 1)]
        let startPoint: CGPoint = CGPoint(x: 0.0, y: 1.0)
        let endPoint: CGPoint = CGPoint(x: 1.0, y: 0.0)
        
        for color in colors {
            gradientLayer.colors?.append(color.cgColor)
        }
        
        gradientLayer.startPoint = startPoint
        gradientLayer.endPoint = endPoint
        layer.insertSublayer(gradientLayer, above: self.layer)
        
        clipsToBounds = true
        layer.cornerRadius = 7
    }
}

#if DEBUG
import SwiftUI

@available(iOS 13, *)
struct KPRatingGradientViewPreview: PreviewProvider {
    
    static var previews: some View {
        // view controller using programmatic UI
        KPRatingGradientView().toPreview()
    }
}
#endif
