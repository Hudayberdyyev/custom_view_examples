//
//  DetailedInfoView.swift
//  custom_view_examples
//
//  Created by Ahmet Hudayberdyyev on 5/7/22.
//

import UIKit

class DetailedInfoView: UIView {
    
    private func initialize() {
        print("DetailedInfoView => \(#function)")
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .systemBlue
    }
    
    init() {
        super.init(frame: .zero)
        print("DetailedInfoView => \(#function)")
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
struct DetailedInfoViewPreview: PreviewProvider {
    
    static var previews: some View {
        // view controller using programmatic UI
        DetailedInfoView().toPreview()
    }
}
#endif
