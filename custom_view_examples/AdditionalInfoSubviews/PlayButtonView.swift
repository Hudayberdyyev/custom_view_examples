//
//  CustomEpisodeCell.swift
//  custom_view_examples
//
//  Created by Ahmet Hudayberdyyev on 5/14/22.
//

import UIKit
import SnapKit

class PlayButtonView: UIView {
    
    //MARK: -UIControls
    private var circleLayer = CAShapeLayer()
    private var prevBounds: CGRect = CGRect()
    
    private var playImageView: UIImageView = {
        let i = UIImageView()
        i.translatesAutoresizingMaskIntoConstraints = false
        i.backgroundColor = .systemPink
        return i
    }()
    
    //MARK: -Initializers
    private func initialize() {
        print("\(#fileID) => \(#function)")
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .systemBlue
    }
    
    init() {
        super.init(frame: .zero)
        print("\(#fileID) => \(#function)")
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
    
    private func setupUI() {
        print("\(#fileID) => \(#function)")
        addSubview(playImageView)
        playImageView.snp.makeConstraints { (make) in
            make.center.equalTo(self)
            make.height.equalTo(self).multipliedBy(0.7)
            make.width.equalTo(self.snp.height).multipliedBy(0.7)
        }
        setupCircleLayer()
    }
    
    private func setupCircleLayer() {
        print("\(#fileID) => \(#function)")
        let path = UIBezierPath(ovalIn: bounds)
        circleLayer = CAShapeLayer()
        circleLayer.path = path.cgPath
        circleLayer.fillColor = UIColor.black.withAlphaComponent(0.3).cgColor
        circleLayer.lineWidth = 3
        circleLayer.strokeColor = UIColor.white.cgColor
        layer.insertSublayer(circleLayer, below: playImageView.layer)
    }
    
    override func layoutSubviews() {
//        if bounds.width == prevBounds.width,
//           bounds.height == prevBounds.height {
//            return
//        }
        circleLayer.removeFromSuperlayer()
        
        let path = UIBezierPath(ovalIn: bounds)
        
        circleLayer = CAShapeLayer()
        circleLayer.path = path.cgPath
        circleLayer.fillColor = UIColor.black.withAlphaComponent(0.3).cgColor
        circleLayer.lineWidth = 3
        circleLayer.strokeColor = UIColor.white.cgColor
        
        layer.insertSublayer(circleLayer, below: playImageView.layer)
    }
}

#if DEBUG
import SwiftUI

@available(iOS 13, *)
struct PlayButtonViewPreview: PreviewProvider {
    
    static var previews: some View {
        // view controller using programmatic UI
        PlayButtonView().toPreview()
    }
}
#endif
