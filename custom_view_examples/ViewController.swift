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
        setupUI()
    }

    private func setupUI() {
        print("\(#fileID) => \(#function)")
        let customView = PlayButtonView()
        view.addSubview(customView)
        customView.snp.makeConstraints { (make) in
            make.center.equalTo(view)
            make.height.equalTo(100)
            make.width.equalTo(100)
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
