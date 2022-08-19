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
    
    private lazy var emailTextField = ParkingTextField(text: "Email", type: .Email)
    
    private lazy var passwordTextField = ParkingTextField(text: "Senha", type: .Password)
    
    private lazy var confirmPasswordTextField = ParkingTextField(text: "Confirmar Senha", type: .Password)
    
    private lazy var faceIdSwitch = ParkingSwitch(stateStart: true)
    
    private lazy var faceIdLabel = ParkingLabel(content: "Entrar usando FaceID", size: 18, type: .blueMessage)
    
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
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        view.addSubview(confirmPasswordTextField)
        view.addSubview(faceIdSwitch)
        view.addSubview(faceIdLabel)
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
        
        emailTextField.topAnchor.constraint(equalTo: CNPJTextField.bottomAnchor, constant: topTextField).isActive = true
        emailTextField.leadingAnchor.constraint(equalTo: nameTextField.leadingAnchor).isActive = true
        emailTextField.trailingAnchor.constraint(equalTo: nameTextField.trailingAnchor).isActive = true
        emailTextField.heightAnchor.constraint(equalToConstant: heightTextField).isActive = true
        
        passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: topTextField).isActive = true
        passwordTextField.leadingAnchor.constraint(equalTo: nameTextField.leadingAnchor).isActive = true
        passwordTextField.trailingAnchor.constraint(equalTo: nameTextField.trailingAnchor).isActive = true
        passwordTextField.heightAnchor.constraint(equalToConstant: heightTextField).isActive = true
        
        confirmPasswordTextField.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: topTextField).isActive = true
        confirmPasswordTextField.leadingAnchor.constraint(equalTo: nameTextField.leadingAnchor).isActive = true
        confirmPasswordTextField.trailingAnchor.constraint(equalTo: nameTextField.trailingAnchor).isActive = true
        confirmPasswordTextField.heightAnchor.constraint(equalToConstant: heightTextField).isActive = true
        
        faceIdSwitch.topAnchor.constraint(equalTo: confirmPasswordTextField.bottomAnchor, constant: topTextField).isActive = true
        faceIdSwitch.leadingAnchor.constraint(equalTo: nameTextField.leadingAnchor).isActive = true
        
        faceIdLabel.centerYAnchor.constraint(equalTo: faceIdSwitch.centerYAnchor, constant: 2).isActive = true
        faceIdLabel.leadingAnchor.constraint(equalTo: faceIdSwitch.trailingAnchor, constant: 10).isActive = true
    }
}
