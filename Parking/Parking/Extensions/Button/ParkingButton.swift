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
    }
    
    private func primaryButton(_ text: String) {
        self.setTitle(text, for: .normal)
        self.backgroundColor = 
    }
    
    private func secondaryButton(_ text: String) {
        
    }
    
    private func tercearyButton(_ text: String) {
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
