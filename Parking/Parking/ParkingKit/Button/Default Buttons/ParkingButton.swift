//
//  ParkingButton.swift
//  Parking
//
//  Created by Usr_Prime on 17/08/22.
//

import UIKit

enum typeButton {
    case primary
    case secondary
    case terceary
    case fourth
}

class ParkingButton: UIButton {

    public convenience init(content: String, type: typeButton) {
        self.init(frame: .zero)
        self.setTitle(content, for: .normal)
        
        switch type {
        case .primary:
            primaryButton()
            
        case .secondary:
            secondaryButton()
            
        case .terceary:
            tercearyButton()
            
        case .fourth:
            fourthButton()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.layer.cornerRadius = 10
        self.titleLabel?.font = UIFont.boldSystemFont(ofSize: 22)
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func primaryButton() {
        self.backgroundColor = Colors.blue
        self.setTitleColor(.white, for: .normal)
    }
    
    private func secondaryButton() {
        self.backgroundColor = .white
        self.setTitleColor(Colors.lightGrey, for: .normal)
        self.layer.borderColor = Colors.lightGrey.cgColor
        self.layer.borderWidth = 2
    }
    
    private func tercearyButton() {
        self.backgroundColor = .clear
        self.setTitleColor(Colors.blue, for: .normal)
    }
    
    private func fourthButton() {
        self.backgroundColor = Colors.lightGrey
        self.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        self.setTitleColor(Colors.darkGrey, for: .normal)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
