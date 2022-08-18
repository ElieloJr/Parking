//
//  RegisterUserViewController.swift
//  Parking
//
//  Created by Usr_Prime on 18/08/22.
//

import UIKit

class RegisterUserViewController: DefaultViewController {
    
    private lazy var logoImageView = ParkingLogoImageView()
    
    private lazy var messageToClient = ParkingLabel(content: "Crie uma conta para acessar e gerir seu estacionamento.", size: 19, type: .blueMessage)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupConstraints()
    }
    
    private func setupView() {
        view.addSubview(logoImageView)
        view.addSubview(messageToClient)
    }
    
    private func setupConstraints() {
        logoImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 56).isActive = true
        logoImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24).isActive = true
        logoImageView.widthAnchor.constraint(equalToConstant: 120).isActive = true
        logoImageView.heightAnchor.constraint(equalToConstant: 120).isActive = true
        
        messageToClient.centerYAnchor.constraint(equalTo: logoImageView.centerYAnchor).isActive = true
        messageToClient.leadingAnchor.constraint(equalTo: logoImageView.trailingAnchor, constant: 10).isActive = true
        messageToClient.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
    }
}
