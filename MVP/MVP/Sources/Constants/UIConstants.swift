//
//  UIConstants.swift
//  MVP
//
//  Created by Nikita Alpatiev on 1/27/23.
//

import UIKit

enum Constants {
    enum Colors {
        static var background = UIColor.white
        static var primary = UIColor(red: 0.09, green: 0.01, blue: 0.25, alpha: 1.00)
        static var border = UIColor.black
        static var text = UIColor.black
        static var lightText = UIColor.white
    }
    
    enum Fonts {
        static var headers = UIFont.boldSystemFont(ofSize: 22)
        static var description = UIFont.italicSystemFont(ofSize: 18)
    }
    
    enum Layout {
        static var paging: CGFloat = 36
        static var cornerRadius: CGFloat = 8
        static var borderWidth: CGFloat = 1.25
    }
}
