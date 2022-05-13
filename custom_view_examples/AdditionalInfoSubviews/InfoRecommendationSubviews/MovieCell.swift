//
//  MovieCell.swift
//  BeletFilm
//
//  Created by Ahmet on 01.01.2022.
//

import UIKit

class MovieCell: BaseCell {
    
    //MARK: - Properties
    let spinner = SpinnerView()
    
    //MARK: - UIControls
    let imageView: CustomUIImageView = {
        let im = CustomUIImageView()
        im.contentMode = .scaleAspectFill
        im.backgroundColor = ColorPalette.Gray.Medium
        im.layer.cornerRadius = 8
        im.clipsToBounds = true
        return im
    }()

    let playImage:UIImageView = {
        let im = UIImageView()
        im.image = UIImage(named: "ic_play_circle_outline_48px-512")?.withRenderingMode(.alwaysTemplate)
        im.tintColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.8)
        im.contentMode = .scaleAspectFill
        im.isHidden = true
        return im
    }()
    
    //MARK: - Methods

    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    override func setupViews() {
    }
    
    override func layoutSubviews() {
        // cell rounded section
        self.layer.cornerRadius = 8.0
        self.layer.masksToBounds = true
        self.contentView.layer.cornerRadius = 8.0
    }
}
