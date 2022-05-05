//
//  PagedView.swift
//  custom_view_examples
//
//  Created by Ahmet Hudayberdyyev on 5/5/22.
//

import UIKit

protocol PagedViewDelegate: AnyObject {
    func didMoveToPage(index: Int)
}

class PagedView: UIView {
    
    // MARK: - Initialization
    init() {
        super.init(frame: .zero)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Properties
    public weak var delegate: PagedViewDelegate?
    
    private lazy var collectionView: UICollectionView = {
        // 1
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(
            frame: .zero,
            collectionViewLayout: layout
        )
        // 2
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.isPagingEnabled = true
        // 3
        collectionView.delegate = self
        collectionView.dataSource = self
        // 4
        collectionView.translatesAutoresizingMaskIntoConstraints =  false
        return collectionView
    }()
    
    // MARK: - UI Setup
    func setupUI() {
        
        // 5
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(collectionView)
        collectionView.backgroundColor = .white
        
        NSLayoutConstraint.activate([
            collectionView.widthAnchor
                .constraint(equalTo: self.widthAnchor),
            collectionView.heightAnchor
                .constraint(equalTo: self.heightAnchor),
            collectionView.centerXAnchor
                .constraint(equalTo: self.centerXAnchor),
            collectionView.centerYAnchor
                .constraint(equalTo: self.centerYAnchor)
        ])
    }
}

extension PagedView: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    // MARK: - Data Source
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // 2
    }
    
    // MARK: - Layout Delegate
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        // 3
        return CGSize(width: self.collectionView.frame.width,
                      height: self.collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        // 4
        return 0
    }
}
