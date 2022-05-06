//
//  BasicInfoView.swift
//  custom_view_examples
//
//  Created by Ahmet Hudayberdyyev on 5/6/22.
//

import UIKit

enum MovieType: String {
    case Serial
    case Film
    
    func getLocalizedMovieType() -> String {
        return self.rawValue
    }
}

class BasicInfoView: UIView {
    
    //MARK: -Properties
    private var movieType: MovieType?
    
    //MARK: -UIControls
    private let movieTypeLabel = UILabel()
    
    private func initialize() {
        print("BasicInfoView => \(#function)")
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .systemRed
        movieType = .Film
    }
    
    init() {
        super.init(frame: .zero)
        print("BasicInfoView => \(#function)")
        initialize()
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
        print("BasicInfoView => \(#function)")
        
    }
}

#if DEBUG
import SwiftUI

@available(iOS 13, *)
struct BasicInfoViewPreview: PreviewProvider {
    
    static var previews: some View {
        // view controller using programmatic UI
        BasicInfoView().toPreview()
    }
}
#endif
