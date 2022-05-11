//
//  DescriptionTextView.swift
//  custom_view_examples
//
//  Created by Ahmet Hudayberdyyev on 5/11/22.
//
import UIKit
import SnapKit

class DescriptionTextView: UITextView {
    
    //MARK: -Properties
    private var isExpanded: Bool = false
    private var heightConstraint: NSLayoutConstraint?
    private let characterLimitForCollapsedText: Int = 255
    
    private let mutableParagraphStyle: NSMutableParagraphStyle = {
        let ps = NSMutableParagraphStyle()
        ps.lineSpacing = 4
        ps.lineBreakMode = .byWordWrapping
//        ps.alignment = .justified
        ps.alignment = .left
        return ps
    }()
    
    private var collapsedText: String = """
    Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one ...
    """
    private var expandedText: String = """
    Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.

    The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from "de Finibus Bonorum et Malorum" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.
    """
    
    //MARK: -Initializers
    private func initialize() {
        print("DescriptionTextView => \(#function)")
        /// Initial configurations
        translatesAutoresizingMaskIntoConstraints = false
        textColor = .green
        backgroundColor = .black
//        text = collapsedText
        attributedText = getAttributedText(for: collapsedText)
        
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
        print("DescriptionTextView => \(#function)")
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
        print("DescriptionTextView => \(#function)")
        /// Change text of text view
        let regularText = isExpanded ? expandedText : collapsedText
        
        attributedText = getAttributedText(for: regularText)
        
        /// Calculate estimated size
        reCalcEstimatedSize()
    }
    
    private func reCalcEstimatedSize() {
        print("DescriptionTextView => \(#function)")
        let size = CGSize(width: frame.width, height: .infinity)
        let estimatedSize = sizeThatFits(size)
        
        /// Reset height constraint and activate it
        self.heightConstraint?.constant = estimatedSize.height
        self.heightConstraint?.isActive = true
    }
    
    private func getAttributedText(for regularText: String) -> NSMutableAttributedString {
        print("DescriptionTextView => \(#function)")
        let result = NSMutableAttributedString()
        
        /// More and less constants
        let readMore = "more"
        let readLess = "less"
        
        /// Suffix of string
        let suffix = isExpanded ? readLess : readMore
        let suffixAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont(name: K.Fonts.robotoLight, size: Constants.basicMovieInfoView.baseInfoFont) ?? .systemFont(ofSize: Constants.basicMovieInfoView.baseInfoFont),
            .foregroundColor: ColorPalette.Blue.moreLessButton,
//            .backgroundColor: ColorPalette.Blue.moreLessButtonBackground.withAlphaComponent(0.05),
//            .underlineStyle: NSUnderlineStyle.single.rawValue,
//            .underlineColor: ColorPalette.Blue.moreLessButton
        ]
        let attributedSuffix = NSAttributedString(string: suffix, attributes: suffixAttributes)
        
        /// Prefix of string
        let prefix = regularText
        let prefixAttiributes: [NSAttributedString.Key: Any] = [
            .font: UIFont(name: K.Fonts.robotoLight, size: Constants.basicMovieInfoView.baseInfoFont) ?? .systemFont(ofSize: Constants.basicMovieInfoView.baseInfoFont),
            .foregroundColor: UIColor.white
        ]
        let attributedPrefix = NSAttributedString(string: prefix, attributes: prefixAttiributes)
        
        /// Resulted string
        result.append(attributedPrefix)
        result.append(attributedSuffix)
        
        /// Add paragraph style attribute
        result.addAttribute(.paragraphStyle, value: mutableParagraphStyle, range: NSRange(location: 0, length: result.length))
        
        return result
    }
}

//MARK: -Public methods
extension DescriptionTextView {
    public func changeState() {
        print("DescriptionTextView => \(#function)")
        
        /// Inverse isExpanded property
        isExpanded = !isExpanded
        
        /// Update ui
        updateUI()
    }
    
    public func resetText(with text: String) {
        print("DescriptionTextView => \(#function)")
        
        /// Set collapsed text
        collapsedText = String(text.prefix(characterLimitForCollapsedText))
        collapsedText.append(" ... ")
        
        /// Set expanded text
        expandedText = text
        expandedText.append(" ")
        
        /// Update ui
        updateUI()
    }
}

#if DEBUG
import SwiftUI

@available(iOS 13, *)
struct DescriptionTextViewPreview: PreviewProvider {
    
    static var previews: some View {
        // view controller using programmatic UI
        DescriptionTextView().toPreview()
    }
}
#endif
