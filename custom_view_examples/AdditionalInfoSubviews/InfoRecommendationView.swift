//
//  InfoRecommendationView.swift
//  custom_view_examples
//
//  Created by Ahmet Hudayberdyyev on 5/13/22.
//

import UIKit
import SnapKit

class InfoRecommendationView: UIView {
    //MARK: -Initializers
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
    }
}

#if DEBUG
import SwiftUI

@available(iOS 13, *)
struct InfoRecommendationViewPreview: PreviewProvider {
    
    static var previews: some View {
        // view controller using programmatic UI
        InfoRecommendationView().toPreview()
    }
}
#endif
