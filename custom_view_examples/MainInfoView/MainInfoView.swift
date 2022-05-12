//
//  MainInfoView.swift
//  custom_view_examples
//
//  Created by Ahmet Hudayberdyyev on 5/6/22.
//

import UIKit
import SnapKit

class MainInfoView: UIView {
    
    //MARK: -UIControls
    private let basicInfoView = BasicInfoView()
    private let detailedInfoView = DetailedInfoView()
    
    //MARK: -Initializers
    private func initialize() {
        print("MainInfoView => \(#function)")
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .systemBlue
    }
    
    init() {
        super.init(frame: .zero)
        print("MainInfoView => \(#function)")
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
        print("MainInfoView => \(#function)")
        addSubview(basicInfoView)
        basicInfoView.snp.makeConstraints { (make) in
            make.top.leading.trailing.equalTo(self)
        }
        
        addSubview(detailedInfoView)
        detailedInfoView.snp.makeConstraints { (make) in
            make.top.equalTo(basicInfoView.snp.bottom)
            make.leading.trailing.bottom.equalTo(self)
        }
    }
}

#if DEBUG
import SwiftUI

@available(iOS 13, *)
struct MainInfoViewPreview: PreviewProvider {
    
    static var previews: some View {
        // view controller using programmatic UI
        MainInfoView().toPreview()
    }
}
#endif
