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
        print("ViewController => \(#function)")
        // Do any additional setup after loading the view.
        view.backgroundColor = .orange
        setupUI()
    }

    private func setupUI() {
        print("ViewController => \(#function)")
//        let customView = ImageButton(image: UIImage(named: "play"), imageColor: .black, backgroundColor: .white, titleColor: .black, height: 0.046)
        let customView = ImageButton(image: UIImage(named: "play"), imageColor: .black, backgroundColor: .white, titleColor: .black, height: 0.046)
        view.addSubview(customView)
        customView.snp.makeConstraints { (make) in
            make.edges.equalTo(view)
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
