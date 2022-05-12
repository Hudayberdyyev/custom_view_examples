//
//  ButtonsBarView.swift
//  custom_view_examples
//
//  Created by Ahmet Hudayberdyyev on 5/12/22.
//

import UIKit
import SnapKit

class InfoButtonsBarView: UIView {
    
    //MARK: -Initializers
    private func initialize() {
        print("ButtonsBarView => \(#function)")
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .systemGreen
    }
    
    init() {
        super.init(frame: .zero)
        print("ButtonsBarView => \(#function)")
        initialize()
    }
    
    @available (*, unavailable)
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    @available (*, unavailable)
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

#if DEBUG
import SwiftUI

@available(iOS 13, *)
struct InfoButtonsBarViewPreview: PreviewProvider {
    
    static var previews: some View {
        // view controller using programmatic UI
        InfoButtonsBarView().toPreview()
    }
}
#endif
