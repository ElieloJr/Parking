//
//  RegisterUserViewController.swift
//  Parking
//
//  Created by Usr_Prime on 18/08/22.
//

import UIKit
import TextFieldFormatter

class RegisterUserViewController: DefaultViewController {
    
    private lazy var logoImageView = ParkingLogoImageView()
    
    private lazy var messageToClient = ParkingLabel(content: "Crie uma conta para acessar e gerir seu estacionamento.", size: 19, type: .blueMessage)
    
    private lazy var nameTextField = ParkingTextField(text: "Nome", type: .Normal)
    
    private lazy var lastNameTextField = ParkingTextField(text: "Sobrenome", type: .Normal)
    
    private lazy var CNPJTextField = TextFieldFormatter(type: .CNPF)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupConstraints()
    }
    
    private func setupView() {
        view.addSubview(logoImageView)
        view.addSubview(messageToClient)
        
        view.addSubview(nameTextField)
        view.addSubview(lastNameTextField)
        view.addSubview(CNPJTextField)
    }
    
    private func setupConstraints() {
        let topTextField: CGFloat = 12
        let heightTextField: CGFloat = 60
        
        logoImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 56).isActive = true
        logoImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24).isActive = true
        logoImageView.widthAnchor.constraint(equalToConstant: 120).isActive = true
        logoImageView.heightAnchor.constraint(equalToConstant: 120).isActive = true
        
        messageToClient.centerYAnchor.constraint(equalTo: logoImageView.centerYAnchor).isActive = true
        messageToClient.leadingAnchor.constraint(equalTo: logoImageView.trailingAnchor, constant: 10).isActive = true
        messageToClient.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        
        nameTextField.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 50).isActive = true
        nameTextField.leadingAnchor.constraint(equalTo: logoImageView.leadingAnchor).isActive = true
        nameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24).isActive = true
        nameTextField.heightAnchor.constraint(equalToConstant: heightTextField).isActive = true
        
        lastNameTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: topTextField).isActive = true
        lastNameTextField.leadingAnchor.constraint(equalTo: nameTextField.leadingAnchor).isActive = true
        lastNameTextField.trailingAnchor.constraint(equalTo: nameTextField.trailingAnchor).isActive = true
        lastNameTextField.heightAnchor.constraint(equalToConstant: heightTextField).isActive = true
        
        CNPJTextField.topAnchor.constraint(equalTo: lastNameTextField.bottomAnchor, constant: topTextField).isActive = true
        CNPJTextField.leadingAnchor.constraint(equalTo: nameTextField.leadingAnchor).isActive = true
        CNPJTextField.trailingAnchor.constraint(equalTo: nameTextField.trailingAnchor).isActive = true
        CNPJTextField.heightAnchor.constraint(equalToConstant: heightTextField).isActive = true
    }
}
