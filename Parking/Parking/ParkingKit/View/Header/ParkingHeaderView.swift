//
//  ParkingHeaderView.swift
//  Parking
//
//  Created by Usr_Prime on 23/08/22.
//

import UIKit

class ParkingHeaderView: UIView {

    private lazy var leftButton: UIButton = {
        let leftButton: UIButton = UIButton()
        leftButton.tintColor = .white
        leftButton.backgroundColor = Colors.darkGrey
        leftButton.contentVerticalAlignment = .fill
        leftButton.contentHorizontalAlignment = .fill
        leftButton.layer.cornerRadius = 6
        leftButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            leftButton.widthAnchor.constraint(equalToConstant: 60),
            leftButton.heightAnchor.constraint(equalToConstant: 60)
        ])
        return leftButton
    }()
    
    private lazy var welcomeMessage = ParkingLabel(content: "Bem vindo de volta,",
                                                   size: 16, type: .lightGreyMessage)
    
    private lazy var meliantName = ParkingLabel(content: "Nome do Meliante",
                                                size: 20, type: .darkGreyMessage)

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(leftButton)
        self.addSubview(welcomeMessage)
        self.addSubview(meliantName)
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        leftButton.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        leftButton.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        leftButton.widthAnchor.constraint(equalToConstant: 60).isActive = true
        leftButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        welcomeMessage.centerYAnchor.constraint(equalTo: leftButton.centerYAnchor, constant: -10).isActive = true
        welcomeMessage.leadingAnchor.constraint(equalTo: leftButton.trailingAnchor, constant: 10).isActive = true
        
        meliantName.topAnchor.constraint(equalTo: welcomeMessage.bottomAnchor, constant: 2).isActive = true
        meliantName.leadingAnchor.constraint(equalTo: welcomeMessage.leadingAnchor).isActive = true
        meliantName.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10).isActive = true
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setImageUser(with image: UIImage) {
        leftButton.setImage(image, for: .normal)
    }
    
    func setUserName(with name: String) {
        meliantName.text = name
    }
}
