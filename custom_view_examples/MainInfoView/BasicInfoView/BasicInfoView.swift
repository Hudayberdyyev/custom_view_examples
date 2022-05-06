//
//  BasicInfoView.swift
//  custom_view_examples
//
//  Created by Ahmet Hudayberdyyev on 5/6/22.
//

import UIKit

class BasicInfoView: UIView {
    
    private func initialize() {
        print("BasicInfoView => \(#function)")
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .systemRed
    }
    
    init() {
        super.init(frame: .zero)
        print("BasicInfoView => \(#function)")
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
struct BasicInfoViewPreview: PreviewProvider {
    
    static var previews: some View {
        // view controller using programmatic UI
        BasicInfoView().toPreview()
    }
}
#endif
