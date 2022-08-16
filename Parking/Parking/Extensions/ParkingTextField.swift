//
//  ParkingTextField.swift
//  Parking
//
//  Created by Usr_Prime on 16/08/22.
//

import UIKit

class ParkingTextField: UITextField {
    
    public convenience init(text: String) {
        self.init(frame: .zero)
        self.placeholder = text
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    private func setupUI() {
        self.backgroundColor = .white
        self.layer.cornerRadius = 10
        self.font = UIFont.init(name: "Farah Regular", size: 20.0)
        self.keyboardType = .emailAddress
        self.autocapitalizationType = .none
        
        self.layer.shadowOpacity = 0.2
        self.layer.shadowRadius = 2.0
        self.layer.shadowOffset = CGSize(width: 1, height: 3)
        self.layer.shadowColor = UIColor.black.cgColor
        
        self.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: self.frame.height))
        self.rightView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: self.frame.height))
        self.leftViewMode = .always
        self.rightViewMode = .always
        
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
