//
//  InfoRecommendationView.swift
//  custom_view_examples
//
//  Created by Ahmet Hudayberdyyev on 5/13/22.
//

import UIKit
import SnapKit

class InfoRecommendationView: UIView {
    
    private var cellWidthValue: CGFloat {
        let screenWidth = UIScreen.main.bounds.width
        return screenWidth / 2.2
    }
    
    //MARK: -UIControl
    lazy var recCollection:UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 3.0
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 8, left: 0, bottom: 8, right: 0)
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.delegate = self
        cv.dataSource = self
        cv.register(MovieCell.self, forCellWithReuseIdentifier: "K.Identifiers.recomendCellID")
        cv.contentInset = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.backgroundColor = .brown
        return cv
    }()
    
    //MARK: -Initializers
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
        addSubview(recCollection)
        recCollection.snp.makeConstraints { (make) in
            make.edges.equalTo(self)
        }
    }
}

//MARK: -Collection view delegate methods
extension InfoRecommendationView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("\(#fileID) => \(#function)")
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        print("\(#fileID) => \(#function)")
        let optionalCell = collectionView.dequeueReusableCell(withReuseIdentifier: "K.Identifiers.recomendCellID", for: indexPath)
        
        guard let cell = optionalCell as? MovieCell else {
            return optionalCell
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        print("\(#fileID) => \(#function)")
        let cellHeightValue = (940.0/600.0) * cellWidthValue
        return CGSize(width: cellWidthValue, height: cellHeightValue)
    }
    
    
}

#if DEBUG
import SwiftUI

@available(iOS 13, *)
struct InfoRecommendationViewPreview: PreviewProvider {
    
    static var previews: some View {
        // view controller using programmatic UI
        InfoRecommendationView().toPreview()
    }
}
#endif
