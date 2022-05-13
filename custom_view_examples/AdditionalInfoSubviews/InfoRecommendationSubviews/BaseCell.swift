//
//  BaseCell.swift
//  BeletFilm
//
//  Created by Ahmet on 30.12.2021.
//

import UIKit

class BaseCell: UICollectionViewCell {
    
    var showPlayIcon = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = ColorPalette.Gray.Medium
        setupViews()
    }
    
    func setupViews() {
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
