//
//  MainInfoView.swift
//  custom_view_examples
//
//  Created by Ahmet Hudayberdyyev on 5/6/22.
//

import UIKit

class MainInfoView: UIView {
    
    private func initialize() {
        print("MainInfoView => \(#function)")
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .systemBlue
    }
    
    init() {
        super.init(frame: .zero)
        print("MainInfoView => \(#function)")
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
struct MainInfoViewPreview: PreviewProvider {
    
    static var previews: some View {
        // view controller using programmatic UI
        MainInfoView().toPreview()
    }
}
#endif
