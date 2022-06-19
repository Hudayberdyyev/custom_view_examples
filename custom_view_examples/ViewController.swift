//
//  ViewController.swift
//  custom_view_examples
//
//  Created by Ahmet Hudayberdyyev on 5/5/22.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("\(#fileID) => \(#function)")
        
        view.backgroundColor = .orange
        
        if #available(iOS 11.0, *) {
            superviewTopConstraint = view.safeAreaLayoutGuide.snp.top
            superviewBottomConstraint = view.safeAreaLayoutGuide.snp.bottom
            superviewLeadingConstraint = view.safeAreaLayoutGuide.snp.leading
            superviewTrailingConstraint = view.safeAreaLayoutGuide.snp.trailing
        } else {
            superviewTopConstraint = topLayoutGuide.snp.bottom
            superviewBottomConstraint = view.snp.bottom
            superviewLeadingConstraint = view.snp.leading
            superviewTrailingConstraint = view.snp.trailing
        }
        
        setupUI()
    }
    
    var superviewTopConstraint: ConstraintItem!
    var superviewBottomConstraint: ConstraintItem!
    var superviewLeadingConstraint: ConstraintItem!
    var superviewTrailingConstraint: ConstraintItem!
    
    private func setupUI() {
        print("\(#fileID) => \(#function)")
        let customView = CollectionView2()
        view.addSubview(customView)
        
        customView.snp.makeConstraints { (make) in
            make.top.equalTo(superviewTopConstraint)
            make.bottom.equalTo(superviewBottomConstraint)
            make.trailing.equalTo(superviewTrailingConstraint)
            make.leading.equalTo(superviewLeadingConstraint)
        }
    }
    
    
}

#if DEBUG
import SwiftUI

@available(iOS 13, *)
struct VCPreview: PreviewProvider {
    
    static var previews: some View {
        // view controller using programmatic UI
        ViewController().toPreview()
    }
}
#endif
