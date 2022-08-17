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
}

class ParkingButton: UIButton {

    public convenience init(content: String, type: typeButton) {
        self.init(frame: .zero)
        self.setTitle(content, for: .normal)
        
        switch type {
        case .primary:
            primaryButton(content)
            
        case .secondary:
            secondaryButton(content)
            
        case .terceary:
            tercearyButton(content)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.layer.cornerRadius = 10
        self.titleLabel?.font = UIFont.boldSystemFont(ofSize: 22)
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func primaryButton(_ text: String) {
        self.backgroundColor = Colors.blue
        self.setTitleColor(.white, for: .normal)
    }
    
    private func secondaryButton(_ text: String) {
        self.backgroundColor = .white
        self.setTitleColor(Colors.lightGrey, for: .normal)
        self.layer.borderColor = Colors.lightGrey.cgColor
        self.layer.borderWidth = 2
    }
    
    private func tercearyButton(_ text: String) {
        self.backgroundColor = .clear
        self.setTitleColor(Colors.blue, for: .normal)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
