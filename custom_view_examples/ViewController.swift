//
//  ViewController.swift
//  custom_view_examples
//
//  Created by Ahmet Hudayberdyyev on 5/5/22.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var viewPager: ViewPager = {
            // 1
            let viewPager = ViewPager(
                tabSizeConfiguration: .fillEqually(height: 60, spacing: 0)
            )
          
            // 2
            let view1 = UIView()
            view1.backgroundColor = .red
            
            let view2 = UIView()
            view2.backgroundColor = .blue
            
            let view3 = UIView()
            view3.backgroundColor = .orange
            
            // 3
            viewPager.tabbedView.tabs = [
                AppTabItemView(title: "First"),
                AppTabItemView(title: "Second"),
                AppTabItemView(title: "Third")
            ]
            viewPager.pagedView.pages = [
                view1,
                view2,
                view3
            ]
            viewPager.translatesAutoresizingMaskIntoConstraints = false
            return viewPager
        }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if #available(iOS 13.0, *) {
            self.overrideUserInterfaceStyle = .light
        } else {
            // Fallback on earlier versions
        }
        self.view.backgroundColor = .white
        self.view.addSubview(viewPager)
        
        NSLayoutConstraint.activate([
            viewPager.widthAnchor.constraint(equalTo: self.view.widthAnchor),
            viewPager.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.7),
            viewPager.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            viewPager.topAnchor.constraint(equalTo: self.view.topAnchor)
        ])
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.title = "ViewPager"
        
        if #available(iOS 13.0, *) {
            self.navigationController?.navigationBar.standardAppearance.backgroundColor = .systemBlue
        } else {
            // Fallback on earlier versions
        }
        if #available(iOS 13.0, *) {
            self.navigationController?.navigationBar.standardAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        } else {
            // Fallback on earlier versions
        }
        
    }

}

