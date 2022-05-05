//
//  ViewPager.swift
//  custom_view_examples
//
//  Created by Ahmet Hudayberdyyev on 5/5/22.
//

import UIKit

class ViewPager: UIView {
    
    // MARK: - Initialization
    
    // 1
    init(tabSizeConfiguration: TabbedView.SizeConfiguration) {
        self.sizeConfiguration = tabSizeConfiguration
        super.init(frame: .zero)
        
        self.setupUI()
        
        tabbedView.delegate =  self
        pagedView.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public let sizeConfiguration: TabbedView.SizeConfiguration
    
    // 2
    public lazy var tabbedView: TabbedView = {
        let tabbedView = TabbedView(
            sizeConfiguration: sizeConfiguration
        )
        return tabbedView
    }()
    
    public let pagedView = PagedView()
    
    // MARK: - UI Setup
    
    // 3
    private func setupUI() {
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(tabbedView)
        self.addSubview(pagedView)
        
        NSLayoutConstraint.activate([
            tabbedView.leftAnchor
                .constraint(equalTo: self.leftAnchor),
            tabbedView.topAnchor
                .constraint(equalTo: self.topAnchor),
            tabbedView.rightAnchor
                .constraint(equalTo: self.rightAnchor),
            tabbedView.heightAnchor
                .constraint(equalToConstant: sizeConfiguration.height)
        ])
        
        NSLayoutConstraint.activate([
            pagedView.leftAnchor
                .constraint(equalTo: self.leftAnchor),
            pagedView.topAnchor
                .constraint(equalTo: self.tabbedView.bottomAnchor),
            pagedView.rightAnchor
                .constraint(equalTo: self.rightAnchor),
            pagedView.bottomAnchor
                .constraint(equalTo: self.bottomAnchor)
        ])
    }
}

// 4
extension ViewPager: TabbedViewDelegate {
    func didMoveToTab(at index: Int) {
        self.pagedView.moveToPage(at: index)
    }
}

extension  ViewPager: PagedViewDelegate {
    func didMoveToPage(index: Int) {
        self.tabbedView.moveToTab(at: index)
    }
}
