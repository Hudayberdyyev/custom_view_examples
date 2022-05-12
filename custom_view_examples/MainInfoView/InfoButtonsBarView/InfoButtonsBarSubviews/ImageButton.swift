//
//  ImageButton.swift
//  custom_view_examples
//
//  Created by Ahmet Hudayberdyyev on 5/12/22.
//

import UIKit

class ImageButton: UIButton {
    private var customImage: UIImage!
    private var imageColor: UIColor!
    private var titleColor: UIColor!
    private var imageHeightConstraint: CGFloat!
    
    //MARK: -Initializers
    private func initialize() {
        print("ImageButton => \(#function)")
        
        translatesAutoresizingMaskIntoConstraints = false
        clipsToBounds = true
        layer.cornerRadius = 7
        let resizedButtonImage = customImage.getImageSizeDependsOnMaxScreenDimension(multipliedBy: imageHeightConstraint)
        
        
        setImage(resizedButtonImage, for: .normal)
        
        imageView?.tintColor = imageColor
        imageView?.contentMode = .scaleAspectFit
//        setTitle("Play", for: .normal)
//        setTitleColor(.black, for: .normal)
        isHidden = false
        
        let attributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: titleColor ?? .white,
            .font: UIFont(name: K.Fonts.robotoLight, size: Constants.basicMovieInfoView.baseInfoFont) ?? .systemFont(ofSize: 13)
        ]
        setAttributedTitle(NSAttributedString(string: "Playlaplay", attributes: attributes), for: .normal)
        
    }
    
    //MARK: -Initializers
    init(image: UIImage?,
         imageColor: UIColor,
         backgroundColor: UIColor,
         titleColor: UIColor,
         height: CGFloat) {
        super.init(frame: .zero)

        print("ImageButton => \(#function)")
        if image == nil {
            return
        }
        /// Set initial values
        self.customImage = image
        self.imageColor = imageColor
        self.titleColor = titleColor
        self.backgroundColor = backgroundColor
        self.imageHeightConstraint = height
        
        initialize()
        
        setInsets(forContentPadding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0), imageTitlePadding: 5)
    }
    
    @available (*, unavailable)
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    @available (*, unavailable)
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    //MARK: -View methods
    func setInsets(
        forContentPadding contentPadding: UIEdgeInsets,
        imageTitlePadding: CGFloat
    ) {
        self.contentEdgeInsets = UIEdgeInsets(
            top: contentPadding.top,
            left: contentPadding.left,
            bottom: contentPadding.bottom,
            right: contentPadding.right + imageTitlePadding
        )
        self.titleEdgeInsets = UIEdgeInsets(
            top: 0,
            left: imageTitlePadding,
            bottom: 0,
            right: -imageTitlePadding
        )
    }
}

extension UIImage {
    func getImageSizeDependsOnMaxScreenDimension(multipliedBy: CGFloat) -> UIImage? {
        // Get bounds of image
        let width = self.size.width
        let height = self.size.height
        
        // Calculate new height of image
        let newHeight = max(UIScreen.main.bounds.height, UIScreen.main.bounds.width) * multipliedBy
        
        // Get aspect ratio
        let aspectRatio = CGFloat(width / height)
        
        // Resize Image
        let resizedButtonImage = self.resizeImage(toSize: CGSize(width: newHeight * aspectRatio, height: newHeight))?.withRenderingMode(.alwaysTemplate)
        
        return resizedButtonImage
    }
    
    func resizeImage(toSize size: CGSize = CGSize(width: 50, height: 50)) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
        self.draw(in: CGRect(origin: CGPoint.zero, size: size))
        
        guard let resizedImage = UIGraphicsGetImageFromCurrentImageContext() else {
            UIGraphicsEndImageContext()
            return nil
        }
        UIGraphicsEndImageContext()
        return resizedImage
    }
}

#if DEBUG
import SwiftUI

@available(iOS 13, *)
struct ImageButtonPreview: PreviewProvider {
    
    static var previews: some View {
        // view controller using programmatic UI
//        ImageButton().toPreview()
        ImageButton(image: UIImage(named: "download"), imageColor: .white, backgroundColor: .black, titleColor: .white, height: 0.046).toPreview()
    }
}
#endif
