//
//  ViewExtensions.swift
//  MVP
//
//  Created by Nikita Alpatiev on 1/27/23.
//

import UIKit

extension UIView {
    func roundedBorders(_ color: UIColor = Constants.Colors.border,
                        _ width: CGFloat = Constants.Layout.borderWidth,
                        _ radius: CGFloat = Constants.Layout.cornerRadius) {
        self.layer.borderColor = color.cgColor
        self.layer.borderWidth = width
        self.layer.cornerRadius = radius
    }
    
    func createShadowLayer(withCornerradius: CGFloat = Constants.Layout.cornerRadius,
                           opacity: Float = 1) {
        self.layer.shadowColor = Constants.Colors.primary.cgColor
        self.layer.shadowOpacity = opacity
        self.layer.shadowOffset = CGSize(width: 0, height: 6)
        self.layer.shadowRadius = withCornerradius
        self.layer.shouldRasterize = true
        self.layer.rasterizationScale = UIScreen.main.scale
    }
    
    func insertBackgroundImage(named name: String, alpha: CGFloat = 1) {
        if let image = UIImage(named: name) {
            backgroundColor = UIColor(patternImage: image).withAlphaComponent(alpha)
        }
    }
    
    func addBlurLayer(opacity value: Float = 0.8) {
        let blurEffect = UIBlurEffect(style: .light)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = self.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        blurEffectView.layer.opacity = value
        addSubview(blurEffectView)
    }
}

// MARK: - Open next vc after 1 sec

extension UIViewController {
    func presentNextAfterOneSecond() {
        if let controller = self as? LoginViewController {
            if let presenter = controller.presenter {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: { [weak presenter] in
                    presenter?.keyboardReturnTapped(text: "Никита Алпатьев")
                })
            }
        }
        if let controller = self as? StudentsListViewController {
            if let presenter = controller.presenter {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: { [weak presenter] in
                    presenter?.userTappedItself()
                })
            }
        }
    }
}
