//
//  ButtonsBarView.swift
//  custom_view_examples
//
//  Created by Ahmet Hudayberdyyev on 5/12/22.
//

import UIKit
import SnapKit

class InfoButtonsBarView: UIView {
    
    private let buttonsHeightMultiplier: CGFloat = 0.046
    private let buttonsWidthMultiplier: CGFloat = 0.47
    
    //MARK: -UIControls
    private let playButton = ImageButton(image: UIImage(named: "play"), imageColor: .black, backgroundColor: .white, titleColor: .black, height: 0.041)
    private let downloadButton = ImageButton(image: UIImage(named: "download"), imageColor: .white, backgroundColor: ColorPalette.Gray.Medium, titleColor: .white, height: 0.031)
    
    //MARK: -Initializers
    private func initialize() {
        print("InfoButtonsBarView => \(#function)")
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .systemGreen
    }
    
    init() {
        super.init(frame: .zero)
        print("InfoButtonsBarView => \(#function)")
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
        print("InfoButtonsBarView => \(#function)")
        addSubview(playButton)
        addSubview(downloadButton)
        
        playButton.snp.makeConstraints { (make) in
            make.leading.top.bottom.equalTo(self)
            make.width.equalTo(self).multipliedBy(buttonsWidthMultiplier)
        }
        downloadButton.snp.makeConstraints { (make) in
            make.trailing.top.bottom.equalTo(self)
            make.width.equalTo(self).multipliedBy(buttonsWidthMultiplier)
        }
    }
}

#if DEBUG
import SwiftUI

@available(iOS 13, *)
struct InfoButtonsBarViewPreview: PreviewProvider {
    
    static var previews: some View {
        // view controller using programmatic UI
        InfoButtonsBarView().toPreview()
    }
}
#endif
