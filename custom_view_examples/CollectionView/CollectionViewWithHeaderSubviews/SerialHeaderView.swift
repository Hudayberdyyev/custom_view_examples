//
//  HeaderView.swift
//  custom_view_examples
//
//  Created by Ahmet Hudayberdyyev on 6/19/22.
//

import UIKit
import SnapKit

class SerialHeaderView: UICollectionReusableView {
    
    private let seasonLabel: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.font = .systemFont(ofSize: 13)
        l.textColor = .white
        l.text = "seasonLabel"
        return l
    }()
    
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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
        setupUI()
    }
    
    @available (*, unavailable)
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setupUI() {
        print("\(#fileID) => \(#function)")
        addSubview(seasonLabel)
        seasonLabel.snp.makeConstraints { (make) in
            make.edges.equalTo(self)
        }
    }
}
