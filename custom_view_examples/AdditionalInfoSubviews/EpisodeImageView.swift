//
//  EpisodeImageView.swift
//  custom_view_examples
//
//  Created by Ahmet Hudayberdyyev on 5/14/22.
//

import UIKit
import SnapKit

class EpisodeImageView: UIImageView {
    
    private let playButtonViewHeightMultiplier: CGFloat = 0.45
    
    private let playButtonView = PlayButtonView()
    
    private let imageView: UIImageView = {
        let i = UIImageView()
        i.translatesAutoresizingMaskIntoConstraints = false
        i.backgroundColor = .brown
        i.clipsToBounds = true
        i.layer.cornerRadius = 5
        return i
    }()
    
    private let progressView: UIProgressView = {
        let pv = UIProgressView()
        pv.progressTintColor =  ColorPalette.SkeletonColors.progressSecondary
        pv.backgroundColor = ColorPalette.SkeletonColors.progressPrimary
        pv.clipsToBounds = true
        pv.layer.cornerRadius = 5
        return pv
    }()
    
    //MARK: -Initializers
    private func initialize() {
        print("\(#fileID) => \(#function)")
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .green
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
        /// Add image view
        addSubview(imageView)
        imageView.snp.makeConstraints { (make) in
            make.top.leading.trailing.equalTo(self)
            make.height.equalTo(self).multipliedBy(0.95)
        }
        
        /// Add playButton into image view
        imageView.addSubview(playButtonView)
        playButtonView.snp.makeConstraints { (make) in
            make.center.equalTo(imageView)
            make.height.equalTo(imageView).multipliedBy(playButtonViewHeightMultiplier)
            make.width.equalTo(imageView.snp.height).multipliedBy(playButtonViewHeightMultiplier)
        }
        playButtonView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(playButtonViewTapped(_:))))
        
        /// Add progress view
        addSubview(progressView)
        progressView.snp.makeConstraints { (make) in
            make.leading.trailing.equalTo(self)
            make.bottom.equalTo(self)
            make.height.equalTo(self).multipliedBy(0.05)
        }
    }
}

//MARK: -Gesture methods
extension EpisodeImageView {
    @objc
    private func playButtonViewTapped(_ sender: UITapGestureRecognizer? ) {
        print("\(#fileID) => \(#function)")
    }
}
