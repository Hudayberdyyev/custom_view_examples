//
//  DrowdownTableViewCell.swift
//  custom_view_examples
//
//  Created by Ahmet Hudayberdyyev on 5/13/22.
//

import UIKit
import SnapKit

class DropdownTableViewCell: UITableViewCell {
    
    //MARK: -Initializers
    private func initialize() {
        print("\(#fileID) -> \(#function)")
        backgroundColor = ColorPalette.DropdownListBackgroundColor
        textLabel?.textColor = UIColor.white.withAlphaComponent(0.9)
        textLabel?.font = UIFont(name: K.Fonts.robotoMedium, size: Constants.basicMovieInfoView.baseInfoFont)
        
        /// Set selected background color
        let v = UIView()
        v.backgroundColor = UIColor.white.withAlphaComponent(0.20)
        selectedBackgroundView = v
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        print("\(#fileID) -> \(#function)")
        initialize()
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        print("\(#fileID) -> \(#function)")
    }
    
    private func setupUI() {
        print("\(#fileID) -> \(#function)")
        let separateLineView = UIView()
        separateLineView.translatesAutoresizingMaskIntoConstraints = false
        separateLineView.backgroundColor = ColorPalette.Gray.Light
        
        addSubview(separateLineView)
        separateLineView.snp.makeConstraints { (make) in
            make.leading.trailing.bottom.equalTo(self)
            make.height.equalTo(self).multipliedBy(0.01)
        }
    }
}
