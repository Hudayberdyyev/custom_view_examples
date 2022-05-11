//
//  DescriptionView.swift
//  custom_view_examples
//
//  Created by Ahmet Hudayberdyyev on 5/7/22.
//

import UIKit
import SnapKit

class DescriptionView: UIView {
    
    //MARK: -Properties
    private var textViewHeightConstraint: NSLayoutConstraint?
    
    //MARK: -UIControls
    private let descriptionTextView = UITextView()
    private var isExpanded = false
    private let descriptionCollapsedText = """
    Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one
    """
    
    private let descriptionExpandedText = """
        Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.

        The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from "de Finibus Bonorum et Malorum" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.
        """
    
    private func initialize() {
        print("DescriptionView => \(#function)")
        
        //TODO: Should be added after testing
        translatesAutoresizingMaskIntoConstraints = false
        /// View constraints
        backgroundColor = .systemBlue
        
        descriptionTextView.translatesAutoresizingMaskIntoConstraints = false
        descriptionTextView.backgroundColor = .black
        descriptionTextView.textColor = .green
        
        /// Allowed and not allowed actions
        descriptionTextView.isEditable = false
        descriptionTextView.isSelectable = false
        descriptionTextView.isUserInteractionEnabled = true
        descriptionTextView.isScrollEnabled = false
        
    }
    
    init() {
        super.init(frame: .zero)
        print("DescriptionView => \(#function)")
        initialize()
        setupUI()
        descriptionTextFetched(text: descriptionCollapsedText)
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
        print("DescriptionView => \(#function)")
        
        addSubview(descriptionTextView)
        descriptionTextView.snp.makeConstraints { (make) in
            make.top.leading.trailing.equalTo(self)

        }
        descriptionTextView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(descriptionTextViewTapped(_:))))
    }
    
    private func descriptionTextFetched(text: String) {
        print("DescriptionView => \(#function)")
        descriptionTextView.text = text
//        textViewHeightConstraint = descriptionTextView.heightAnchor.constraint(equalToConstant: 50)
        textViewHeightConstraint?.isActive = true
        textViewChanged()
    }
    
    @objc
    private func descriptionTextViewTapped(_ sender: UITextView?) {
        print("DescriptionView => \(#function)")
        descriptionTextView.text = isExpanded ? descriptionCollapsedText : descriptionExpandedText
        isExpanded = !isExpanded
        
        textViewChanged()
        UIView.animate(withDuration: 0.3) {
            self.layoutIfNeeded()
        }

    }
    
    private func textViewChanged() {
        let size = CGSize(width: frame.width, height: .infinity)
        let estimatedSize = self.descriptionTextView.sizeThatFits(size)
        textViewHeightConstraint?.constant = estimatedSize.height
    }
}

#if DEBUG
import SwiftUI

@available(iOS 13, *)
struct DescriptionViewPreview: PreviewProvider {
    
    static var previews: some View {
        // view controller using programmatic UI
        DescriptionView().toPreview()
    }
}
#endif
