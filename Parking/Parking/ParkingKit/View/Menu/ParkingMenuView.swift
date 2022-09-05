//
//  ParkingMenuView.swift
//  Parking
//
//  Created by Usr_Prime on 30/08/22.
//

import UIKit

class ParkingMenuView: UIView {
    
    public let historicButton = ParkingButton(content: "Histórico do dia".uppercased(),
                                               type: .fourth)
    public let profileButton = ParkingButton(content: "Perfil".uppercased(), type: .fourth)
    public let exitButton = ParkingButton(content: "Sair".uppercased(), type: .primary)

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(historicButton)
        self.addSubview(profileButton)
        self.addSubview(exitButton)
        
        setupConstraints()
        self.backgroundColor = .white
        self.layer.cornerRadius = 10
        self.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        exitButton.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        
        self.isHidden = true
        self.layer.shadowColor = UIColor.white.cgColor
        self.layer.shadowOpacity = 0.1
        self.layer.shadowOffset = CGSize(width: 1, height: 4)
        
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            historicButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            historicButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            historicButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            historicButton.heightAnchor.constraint(equalToConstant: 44),
            
            profileButton.topAnchor.constraint(equalTo: historicButton.bottomAnchor, constant: 10),
            profileButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            profileButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            profileButton.heightAnchor.constraint(equalToConstant: 44),
            
            exitButton.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            exitButton.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            exitButton.heightAnchor.constraint(equalToConstant: 50),
            exitButton.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
