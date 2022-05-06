//
//  UIView+Preview.swift
//  custom_view_examples
//
//  Created by Ahmet Hudayberdyyev on 5/6/22.
//

import UIKit

#if DEBUG
import SwiftUI

@available(iOS 13, *)
extension UIView {
    private struct Preview: UIViewRepresentable {
        func updateUIView(_ uiView: UIView, context: Context) {
            
        }
        
        // this variable is used for injecting the current view controller
        let view: UIView

        func makeUIView(context: Context) -> UIView {
            return view
        }
    }

    func toPreview() -> some View {
        // inject self (the current view controller) for the preview
        Preview(view: self)
    }
}
#endif
