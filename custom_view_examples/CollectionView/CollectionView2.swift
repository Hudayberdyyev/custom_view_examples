//
//  CollectionView2.swift
//  custom_view_examples
//
//  Created by Ahmet Hudayberdyyev on 6/16/22.
//

import UIKit
import SnapKit

class CollectionView2: UIView {
    
    private lazy var serialsCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.delegate = self
        cv.dataSource = self
        cv.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "K.Identifiers.downloadedSerialCellID")
        cv.backgroundColor = .yellow
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()
    
    lazy var downCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.delegate = self
        cv.dataSource = self
        cv.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "K.Identifiers.downloadCellID")
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
        
        addSubview(serialsCollection)
        serialsCollection.snp.makeConstraints { (make) in
            make.top.leading.trailing.equalTo(self)
            make.height.equalTo(100)
        }
        
        addSubview(downCollection)
        downCollection.snp.makeConstraints { (make) in
            make.top.equalTo(serialsCollection.snp.bottom)
            make.leading.trailing.equalTo(self)
            make.bottom.equalTo(self)
        }
    }
}

//MARK: -Collection view extension
extension CollectionView2: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == serialsCollection {
            return 1
        }
        
        // Downloads collection
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == serialsCollection {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "K.Identifiers.downloadedSerialCellID", for: indexPath)
            cell.backgroundColor = .green
            return cell
        }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "K.Identifiers.downloadCellID", for: indexPath)
        cell.backgroundColor = .brown
        return cell
    }
}

#if DEBUG
import SwiftUI

@available(iOS 13, *)
struct CollectionView2Preview: PreviewProvider {
    
    static var previews: some View {
        // view controller using programmatic UI
        CollectionView2().toPreview()
    }
}
#endif
