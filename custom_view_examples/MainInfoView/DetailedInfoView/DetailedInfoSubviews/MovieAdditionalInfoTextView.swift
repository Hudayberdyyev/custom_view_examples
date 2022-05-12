//
//  MovieAdditionalInfoTextView.swift
//  custom_view_examples
//
//  Created by Ahmet Hudayberdyyev on 5/11/22.
//

import UIKit
import SnapKit

class MovieAdditionalInfoTextView: UITextView {
    
    //MARK: -Properties
    private var heightConstraint: NSLayoutConstraint?
    
    private let mutableParagraphStyle: NSMutableParagraphStyle = {
        let ps = NSMutableParagraphStyle()
        ps.lineSpacing = 4
        ps.lineBreakMode = .byWordWrapping
//        ps.alignment = .justified
        ps.alignment = .left
        return ps
    }()
    
    private var genre = "Жанр: "
    private var country = "Страна: "
    private var lang = "Язык: "
    private var actor = "Актерский и режиссерский состав: "
    private var countryList = "США, Мексика\n"
    private var genreList = "Фантастика, Драма\n"
    private var langList = "Русский\n"
    private var actorList = "Джони Депп, Николь Кидман, Марго Робби, Шарлиз Терон\n"
    
    //MARK: -Initializers
    private func initialize() {
        print("DescriptionTextView => \(#function)")
        /// Initial configurations
        translatesAutoresizingMaskIntoConstraints = false
        textColor = .green
        backgroundColor = .black
//        text = collapsedText
        attributedText = getAttributedText()
        
        /// Allowed and not allowed actions
        isScrollEnabled = false
        isEditable = false
        isSelectable = false
        isUserInteractionEnabled = true
        
        /// Skeleton view configuartions
        //TODO: Should be implemented !!!
    }
    
    init() {
        super.init(frame: .zero, textContainer: nil)
        print("MovieAdditionalInfoTextView => \(#function)")
        initialize()
        reCalcEstimatedSize()
    }
    
    @available (*, unavailable)
    override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
    }
    
    @available (*, unavailable)
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    //MARK: -View methods
    private func updateUI() {
        print("MovieAdditionalInfoTextView => \(#function)")
        /// Change text of text view
        
        attributedText = getAttributedText()
        
        /// Calculate estimated size
        reCalcEstimatedSize()
    }
    
    private func reCalcEstimatedSize() {
        print("MovieAdditionalInfoTextView => \(#function)")
        let size = CGSize(width: frame.width, height: .infinity)
        let estimatedSize = sizeThatFits(size)
        
        /// Reset height constraint and activate it
        self.heightConstraint?.constant = estimatedSize.height
        self.heightConstraint?.isActive = true
    }
    
    private func getAttributedText() -> NSMutableAttributedString {
        print("MovieAdditionalInfoTextView => \(#function)")
        let result = NSMutableAttributedString()
        
        let titleAttribute: [NSAttributedString.Key: Any] = [
            .font: UIFont(name: K.Fonts.robotoLight, size: Constants.basicMovieInfoView.baseInfoFont) ?? .systemFont(ofSize: Constants.basicMovieInfoView.baseInfoFont),
            .foregroundColor: UIColor.white
        ]
        
        let listAttribute: [NSAttributedString.Key: Any] = [
            .font: UIFont(name: K.Fonts.robotoLight, size: Constants.basicMovieInfoView.baseInfoFont) ?? .systemFont(ofSize: Constants.basicMovieInfoView.baseInfoFont),
            .foregroundColor: ColorPalette.Gray.Light
        ]
        
        let actorTitleAttribute: [NSAttributedString.Key: Any] = [
            .font: UIFont(name: K.Fonts.robotoMedium, size: Constants.basicMovieInfoView.baseInfoFont) ?? .systemFont(ofSize: Constants.basicMovieInfoView.baseInfoFont),
            .foregroundColor: UIColor.white
        ]
        
        let attributedGenreTitle = NSAttributedString(string: genre, attributes: titleAttribute)
        let attributedGenreList = NSAttributedString(string: genreList, attributes: listAttribute)
        let attributedCountryTitle = NSAttributedString(string: country, attributes: titleAttribute)
        let attributedCountryList = NSAttributedString(string: countryList, attributes: listAttribute)
        let attributedActorTitle = NSAttributedString(string: actor, attributes: actorTitleAttribute)
        let attributedActorList = NSAttributedString(string: actorList, attributes: listAttribute)
        let attributedLangTitle = NSAttributedString(string: lang, attributes: titleAttribute)
        let attributedLangList = NSAttributedString(string: langList, attributes: listAttribute)
        
        result.append(attributedGenreTitle)
        result.append(attributedGenreList)
        result.append(attributedCountryTitle)
        result.append(attributedCountryList)
        result.append(attributedLangTitle)
        result.append(attributedLangList)
        result.append(attributedActorTitle)
        result.append(attributedActorList)
        
        /// Add paragraph style attribute
        result.addAttribute(.paragraphStyle, value: mutableParagraphStyle, range: NSRange(location: 0, length: result.length))
        
        return result
    }
}

//MARK: -Public methods
extension MovieAdditionalInfoTextView {
    public func resetText(with text: String) {
        print("MovieAdditionalInfoTextView => \(#function)")
        
        /// Update ui
        updateUI()
    }
}

#if DEBUG
import SwiftUI

@available(iOS 13, *)
struct MovieAdditionalInfoTextViewPreview: PreviewProvider {
    
    static var previews: some View {
        // view controller using programmatic UI
        MovieAdditionalInfoTextView().toPreview()
    }
}
#endif
