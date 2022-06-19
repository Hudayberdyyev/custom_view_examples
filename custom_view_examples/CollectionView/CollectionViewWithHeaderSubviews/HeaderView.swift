//
//  HeaderView.swift
//  custom_view_examples
//
//  Created by Ahmet Hudayberdyyev on 6/19/22.
//

import UIKit
import SnapKit

class SerialsHeaderView: UIView {
    
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
        addSubview(seasonLabel)
        seasonLabel.snp.makeConstraints { (make) in
            make.edges.equalTo(self)
        }
    }
}
