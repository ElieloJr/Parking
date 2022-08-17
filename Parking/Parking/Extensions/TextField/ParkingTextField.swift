//
//  ParkingTextField.swift
//  Parking
//
//  Created by Usr_Prime on 16/08/22.
//

import UIKit

class ParkingTextField: UITextField {
    
    private lazy var eyeButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setBackgroundImage(UIImage(systemName: "eye.slash"), for: .normal)
        button.tintColor = .lightGray
        button.frame = CGRect(x: CGFloat(self.frame.size.width - 25), y: CGFloat(5), width: CGFloat(25), height: CGFloat(25))
        button.addTarget(self, action: #selector(self.setSecure), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    public convenience init(text: String, type: UIKeyboardType, isPassword: Bool? = false) {
        self.init(frame: .zero)
        guard let isPassword = isPassword else { return }

        self.placeholder = text
        self.keyboardType = type
        self.isSecureTextEntry = isPassword
        
        if isPassword { self.rightView = eyeButton }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .white
        self.layer.cornerRadius = 10
        self.font = UIFont.init(name: "Farah Regular", size: 20.0)
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
    
    @IBAction func setSecure(_ sender: Any) {
        if self.isSecureTextEntry {
            eyeButton.setBackgroundImage(UIImage(systemName: "eye"), for: .normal)
            self.isSecureTextEntry = false
        } else {
            eyeButton.setBackgroundImage(UIImage(systemName: "eye.slash"), for: .normal)
            self.isSecureTextEntry = true
        }
    }
}
