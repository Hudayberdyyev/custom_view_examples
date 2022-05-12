//
//  DetailedInfoView.swift
//  custom_view_examples
//
//  Created by Ahmet Hudayberdyyev on 5/7/22.
//

import UIKit

class DetailedInfoView: UIView {
    
    private var descriptionTextView = DescriptionTextView()
    private let movieAdditionalInfoView = MovieAdditionalInfoView()
    private var defaultDescriptionText = "Патрик Джейн - детектив и независимый консультант из Калифорнийского Бюро Расследований (КБР), он использует свои отточенные, как лезвие, навыки наблюдения для раскрытия тяжких преступлений. В самом Бюро Джейн известен за частые нарушения протокола, а также за его звездное прошлое: он работал медиумом, однако теперь сам признает, что симулировал паранормальные способности..."
    
    private func initialize() {
        print("DetailedInfoView => \(#function)")
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .systemBlue
    }
    
    init() {
        super.init(frame: .zero)
        print("DetailedInfoView => \(#function)")
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
        print("DetailedInfoView => \(#function)")
        /// Description text view
        addSubview(descriptionTextView)
        descriptionTextView.snp.makeConstraints { (make) in
            make.trailing.leading.top.equalTo(self)
        }
        descriptionTextView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(textViewTapped(_:))))
        descriptionTextView.resetText(with: defaultDescriptionText)
        
        /// Movie additional info view (genres, country, lang, actors)
        addSubview(movieAdditionalInfoView)
        movieAdditionalInfoView.snp.makeConstraints { (make) in
            make.top.equalTo(descriptionTextView.snp.bottom)
            make.leading.trailing.bottom.equalTo(self)
        }
    }
    
    @objc
    private func textViewTapped(_ sender: UITextView? ) {
        print("ViewController => \(#function)")
        descriptionTextView.changeState()
        
        /// Fold/Collapse animation
        UIView.animate(withDuration: 0.3) {
            self.layoutIfNeeded()
        }
    }
}

#if DEBUG
import SwiftUI

@available(iOS 13, *)
struct DetailedInfoViewPreview: PreviewProvider {
    
    static var previews: some View {
        // view controller using programmatic UI
        DetailedInfoView().toPreview()
    }
}
#endif
