//
//  CollectionViewWithHeader.swift
//  custom_view_examples
//
//  Created by Ahmet Hudayberdyyev on 6/19/22.
//

import UIKit
import SnapKit

class CollectionViewWithHeader: UIView {
    
    lazy var downCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.delegate = self
        cv.dataSource = self
        cv.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "K.Identifiers.downloadCellID")
        cv.register(SerialHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "serialHeaderCellID")
        cv.backgroundColor = .systemPink
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()
    
    private func initialize() {
        print("\(#fileID) => \(#function)")
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .systemBlue
    }
    
    init() {
        super.init(frame: .zero)
        print("\(#fileID) => \(#function)")
        initialize()
        setupUI()
    }
    
    @available (*, unavailable)
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    @available (*, unavailable)
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setupUI() {
        print("\(#fileID) => \(#function)")
        addSubview(downCollection)
        
        downCollection.snp.makeConstraints { (make) in
            make.edges.equalTo(self)
        }
    }
}

extension CollectionViewWithHeader: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "K.Identifiers.downloadCellID", for: indexPath)
        cell.backgroundColor = .green
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: 100, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        // Get headerView
        let optionalReusableView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "serialHeaderCellID", for: indexPath)
        
        guard let reusableView = optionalReusableView as? SerialHeaderView else {
            return optionalReusableView
        }
        
        reusableView.backgroundColor = .brown
        return reusableView
    }
}
