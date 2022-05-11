//
//  ViewController.swift
//  custom_view_examples
//
//  Created by Ahmet Hudayberdyyev on 5/5/22.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    private var customView = DescriptionTextView()

    override func viewDidLoad() {
        super.viewDidLoad()
        print("ViewController => \(#function)")
        // Do any additional setup after loading the view.
        view.backgroundColor = .orange
        setupUI()
    }

    private func setupUI() {
        print("ViewController => \(#function)")
        view.addSubview(customView)
        customView.snp.makeConstraints { (make) in
//            make.edges.equalTo(view)
            make.trailing.leading.top.equalTo(view)
        }
        
        customView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(textViewTapped(_:))))
    }
    
    @objc
    private func textViewTapped(_ sender: UITextView? ) {
        print("ViewController => \(#function)")
        customView.changeState()
        
        /// Fold/Collapse animation
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
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
