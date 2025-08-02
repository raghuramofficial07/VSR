//
//  Card.swift
//  GPA
//
//  Created by RaghuRam on 31/07/25.
//

import SwiftUI
import UIKit

import UIKit

@IBDesignable class RoundedCardView: UIView {
    
    private let blurView = UIVisualEffectView(effect: UIBlurEffect(style: .systemThinMaterial))
    
    @IBInspectable var cornerRadius: CGFloat = 16
    @IBInspectable var shadowOpacity: Float = 0.15
    @IBInspectable var shadowRadius: CGFloat = 8
    @IBInspectable var shadowOffsetY: CGFloat = 4

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCard()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupCard()
    }

    private func setupCard() {
        blurView.translatesAutoresizingMaskIntoConstraints = false
        insertSubview(blurView, at: 0)

        NSLayoutConstraint.activate([
            blurView.topAnchor.constraint(equalTo: topAnchor),
            blurView.bottomAnchor.constraint(equalTo: bottomAnchor),
            blurView.leadingAnchor.constraint(equalTo: leadingAnchor),
            blurView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])

        blurView.clipsToBounds = true
        layer.cornerRadius = cornerRadius
        layer.masksToBounds = false

        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = shadowOpacity
        layer.shadowRadius = shadowRadius
        layer.shadowOffset = CGSize(width: 0, height: shadowOffsetY)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = cornerRadius
        blurView.layer.cornerRadius = cornerRadius
    }
}
