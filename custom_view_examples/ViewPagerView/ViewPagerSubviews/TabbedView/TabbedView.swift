//
//  TabbedView.swift
//  custom_view_examples
//
//  Created by Ahmet Hudayberdyyev on 5/5/22.
//

import UIKit

// 1
protocol TabbedViewDelegate: AnyObject {
    func didMoveToTab(at index: Int)
}

class TabbedView: UIView {
    
    // 2
    enum SizeConfiguration {
        case fillEqually(height: CGFloat, spacing: CGFloat = 0)
        case fixed(width: CGFloat, height: CGFloat, spacing: CGFloat = 0)
        
        var height: CGFloat {
            switch self {
            case let .fillEqually(height, _):
                return height
            case let .fixed(_, height, _):
                return height
            }
        }
    }
    
    // 3
    // MARK: - Lifecycle
    
    // 1
    init(sizeConfiguration: SizeConfiguration,
         tabs: [TabItemProtocol] = []) {
        
        self.sizeConfiguration = sizeConfiguration
        self.tabs = tabs
        super.init(frame: .zero)
        
        self.setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Properties
    weak var delegate: TabbedViewDelegate?
    
    public let sizeConfiguration: SizeConfiguration
    
    // 4
    private var currentlySelectedIndex: Int = 0
    
    // 5
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.estimatedItemSize = .zero
        let collectionView = UICollectionView(
            frame: .zero,
            collectionViewLayout: layout
        )
        collectionView.backgroundColor = .white
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(TabCollectionViewCell.self, forCellWithReuseIdentifier: "TabCollectionViewCell")
        collectionView.translatesAutoresizingMaskIntoConstraints =  false
        return collectionView
    }()
    
    public var tabs: [TabItemProtocol] {
        didSet {
            self.collectionView.reloadData()
            self.tabs[currentlySelectedIndex].onSelected()
        }
    }

    // MARK: UI Setup
    
    // 6
    private func setupUI() {
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.leftAnchor
                .constraint(equalTo: self.leftAnchor),
            collectionView.topAnchor
                .constraint(equalTo: self.topAnchor),
            collectionView.rightAnchor
                .constraint(equalTo: self.rightAnchor),
            collectionView.bottomAnchor
                .constraint(equalTo: self.bottomAnchor)
        ])
    }
    
    public func moveToTab(at index: Int) {
        self.collectionView.scrollToItem(at: IndexPath(item: index, section: 0), at: .centeredHorizontally, animated: true)
        
        self.tabs[currentlySelectedIndex].onNotSelected()
        self.tabs[index].onSelected()
        
        self.currentlySelectedIndex = index
    }
}

extension TabbedView: UICollectionViewDelegateFlowLayout {
    
    // 5
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        switch sizeConfiguration {
        case let .fillEqually(height, spacing):
            let totalWidth = self.frame.width
            let widthPerItem = (
                totalWidth - (
                    spacing * CGFloat((self.tabs.count + 1))
                )
            ) / CGFloat(self.tabs.count)
            
            return CGSize(width: widthPerItem,
                          height: height)
            
        case let .fixed(width, height, spacing):
            return CGSize(width: width - (spacing * 2),
                          height: height)
        }
    }
    
    // 6
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        switch sizeConfiguration {
        case let .fillEqually(_, spacing),
             let .fixed(_, _, spacing):
            
            return spacing
        }
    }
    
}

extension TabbedView: UICollectionViewDataSource {
    // 7
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tabs.count
    }
    
    // 8
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TabCollectionViewCell", for: indexPath) as! TabCollectionViewCell
        cell.view = tabs[indexPath.row]
        return cell
    }
}

extension TabbedView: UICollectionViewDelegate {
    
    // 9
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.moveToTab(at: indexPath.item)
        self.delegate?.didMoveToTab(at: indexPath.item)
    }
}
