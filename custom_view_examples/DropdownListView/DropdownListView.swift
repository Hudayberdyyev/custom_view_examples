//
//  DropdownListView.swift
//  custom_view_examples
//
//  Created by Ahmet Hudayberdyyev on 5/13/22.
//

import UIKit
import SnapKit

class DropdownListView: UIView {
    
    //MARK: -Properties
    private let imageTitlePadding: CGFloat = 10.0
    
    //MARK: -UIControls
    
    private lazy var dropdownButton: UIButton = {
        let b = UIButton()
        
        /// Initial setup
        b.translatesAutoresizingMaskIntoConstraints = false
        b.backgroundColor = ColorPalette.DropdownListBackgroundColor
        b.semanticContentAttribute = .forceRightToLeft
        
        /// Set default title
        let attributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.white,
            .font: UIFont(name: K.Fonts.robotoMedium, size: Constants.basicMovieInfoView.baseInfoFont) ?? .systemFont(ofSize: 13)
        ]
        b.setAttributedTitle(NSAttributedString(string: "10 Episode", attributes: attributes), for: .normal)
        
        /// Set edge insets
        b.contentEdgeInsets = UIEdgeInsets(top: 5, left: 5 + imageTitlePadding, bottom: 5, right: 5)
        b.titleEdgeInsets = UIEdgeInsets(
            top: 0,
            left: -imageTitlePadding,
            bottom: 0,
            right: imageTitlePadding
        )
        
        /// Add gesture recognizer
        b.addTarget(self, action: #selector(dropdownButtonTapped(_:)), for: .touchUpInside)
        
        /// Rounded corners
        b.clipsToBounds = true
        b.layer.cornerRadius = 5
        return b
    }()
    
    let transparentView = UIView()
    let tableView = UITableView()
    var dataSource = [String]()
    
    //MARK: -Initializers
    
    private func initialize() {
        print("\(#fileID) => \(#function)")
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .systemBlue
        
        /// Table view initial setup
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
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
    
    override func layoutSubviews() {
        super.layoutSubviews()
        print("\(#fileID) => \(#function)")
        reDrawDropdownButtonImage()
    }
    
    private func setupUI() {
        print("\(#fileID) => \(#function)")
        addSubview(dropdownButton)
        dropdownButton.snp.makeConstraints { (make) in
            make.leading.top.equalTo(self).offset(10.0)
            make.height.equalTo(self).multipliedBy(0.04)
            make.width.equalTo(self).multipliedBy(0.3)
        }
    }
    
    private func addTransparentView(frames: CGRect) {
        let window = UIApplication.shared.keyWindow
        transparentView.frame = window?.frame ?? self.frame
        addSubview(transparentView)
        
        tableView.frame = CGRect(x: frames.origin.x, y: frames.origin.y + frames.height, width: frames.width, height: 0)
        addSubview(tableView)
        tableView.layer.cornerRadius = 5
        
        transparentView.backgroundColor = UIColor.black.withAlphaComponent(0.9)
        tableView.reloadData()
        let tapgesture = UITapGestureRecognizer(target: self, action: #selector(removeTransparentView))
        transparentView.addGestureRecognizer(tapgesture)
        transparentView.alpha = 0
        UIView.animate(withDuration: 0.4, delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: .curveEaseInOut, animations: {
            self.transparentView.alpha = 0.5
            self.tableView.frame = CGRect(x: frames.origin.x, y: frames.origin.y + frames.height + 5, width: frames.width, height: CGFloat(self.dataSource.count * 50))
        }, completion: nil)
    }
    
    @objc func removeTransparentView() {
        let frames = dropdownButton.frame
        UIView.animate(withDuration: 0.4, delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: .curveEaseInOut, animations: {
            self.transparentView.alpha = 0
            self.tableView.frame = CGRect(x: frames.origin.x, y: frames.origin.y + frames.height, width: frames.width, height: 0)
        }, completion: nil)
    }
}

//MARK: -Dropdown button methods
extension DropdownListView {
    private func reDrawDropdownButtonImage() {
        print("\(#fileID) => \(#function)")
        guard let dropdownImage = UIImage(named: "path4")?.withRenderingMode(.alwaysOriginal) else {
            return
        }
        /// Get aspect ratio of dropdown image
        let dropdownImageAspectRatio = dropdownImage.size.height / dropdownImage.size.width
        
        /// Calculate image width relative to buttons width
        let dropdownImageWidth = dropdownButton.frame.width * 0.16
        
        /// Calculate image height relative to aspect ratio of original image
        let dropdownImageHeight = dropdownImageWidth * dropdownImageAspectRatio
        
        /// Resize image
        let resizedImage = UIImage(named: "path4")?.withRenderingMode(.alwaysOriginal).resizeImage(toSize: CGSize(width: dropdownImageWidth, height: dropdownImageHeight))
        
        /// Set image
        dropdownButton.setImage(resizedImage, for: .normal)
    }
    
    private func resetTitleOfDropdownButton(to text: String) {
        print("\(#fileID) => \(#function)")
        
        DispatchQueue.main.async {
            let attributes: [NSAttributedString.Key: Any] = [
                .foregroundColor: UIColor.white,
                .font: UIFont(name: K.Fonts.robotoLight, size: Constants.basicMovieInfoView.baseInfoFont) ?? .systemFont(ofSize: 13)
            ]
            self.dropdownButton.setAttributedTitle(NSAttributedString(string: text, attributes: attributes), for: .normal)
        }
    }
    
    @objc
    func dropdownButtonTapped(_ sender: UIButton? ) {
        print("\(#fileID) => \(#function)")
        dataSource = ["Apple", "Mango", "Orange"]
        addTransparentView(frames: dropdownButton.frame)
    }
}

extension DropdownListView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = dataSource[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        resetTitleOfDropdownButton(to: dataSource[indexPath.row])
        removeTransparentView()
    }
}

#if DEBUG
import SwiftUI

@available(iOS 13, *)
struct DropdownListViewPreview: PreviewProvider {
    
    static var previews: some View {
        // view controller using programmatic UI
        DropdownListView().toPreview()
    }
}
#endif
