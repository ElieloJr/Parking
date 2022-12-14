//
//  ParkingLabel.swift
//  Parking
//
//  Created by Usr_Prime on 18/08/22.
//

import UIKit

enum typeLabel {
    case errorMessage
    case blueLeftMessage
    case blueCenterMessage
    case lightGreyMessage
    case darkGreyMessage
    case whiteMessage
}

class ParkingLabel: UILabel {
    
    private var fontName: String = "Arial Hebrew Bold"
    
    public convenience init(content: String, size: Int, type: typeLabel) {
        self.init(frame: .zero)
        
        switch type {
        case .errorMessage:
            self.isHidden = true
            self.textColor = .red
            self.textAlignment = .center
            self.font = UIFont(name:fontName, size: CGFloat(size))
        case .blueLeftMessage:
            self.textColor = Colors.blue
            self.textAlignment = .left
            self.numberOfLines = 6
            self.font = UIFont(name:fontName, size: CGFloat(size))
        case .blueCenterMessage:
            self.textColor = Colors.blue
            self.textAlignment = .center
            self.numberOfLines = 6
            self.font = UIFont(name: "Arial Rounded MT Bold", size: CGFloat(size))
        case .lightGreyMessage:
            self.textColor = Colors.lightGrey
            self.textAlignment = .center
            self.font = UIFont(name: "Helvetica Neue Bold", size: CGFloat(size))
        case .darkGreyMessage:
            self.font = UIFont(name:fontName, size: CGFloat(size))
            self.textColor = Colors.darkGrey
            self.textAlignment = .left
            self.numberOfLines = 6
        case .whiteMessage:
            self.font = UIFont(name:"Arial Rounded MT Bold", size: CGFloat(size))
            self.textColor = .white
        }
        
        self.text = content
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
