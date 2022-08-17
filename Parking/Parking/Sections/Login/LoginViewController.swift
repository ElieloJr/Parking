//
//  LoginViewController.swift
//  Parking
//
//  Created by Usr_Prime on 16/08/22.
//

import UIKit

class LoginViewController: DefaultViewController {

    private lazy var logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .blue
        imageView.image = UIImage(named: "Parking_icon")
        imageView.layer.cornerRadius = 16
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var loginLabel: UILabel = {
        let label = UILabel()
        label.text = "Login"
        label.font = UIFont(name:"Arial Hebrew Bold", size: 25.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var emailTextField = ParkingTextField(text: "Email", type: .emailAddress)
    
    private lazy var passwordTextField = ParkingTextField(text: "Senha", type: .default, isPassword: true)
    
    private lazy var entryButton = ParkingButton(content: "Entrar", type: .primary)
    
    private lazy var messageErrorLabel: UILabel = {
        let label = UILabel()
        label.text = "Email ou senha inválido"
        label.textColor = .red
        label.isHidden = false
        label.textAlignment = .center
        label.font = UIFont(name:"Arial Hebrew Bold", size: 17.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupConstraints()
    }

    private func setupView() {
        view.addSubview(logoImageView)
        view.addSubview(loginLabel)
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        view.addSubview(entryButton)
        view.addSubview(messageErrorLabel)
    }
    
    private func setupConstraints() {
        logoImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 130).isActive = true
        logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        logoImageView.widthAnchor.constraint(equalToConstant: 150).isActive = true
        logoImageView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        
        loginLabel.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 100).isActive = true
        loginLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24).isActive = true
        
        emailTextField.topAnchor.constraint(equalTo: loginLabel.bottomAnchor, constant: 10).isActive = true
        emailTextField.leadingAnchor.constraint(equalTo: loginLabel.leadingAnchor).isActive = true
        emailTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24).isActive = true
        emailTextField.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 20).isActive = true
        passwordTextField.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor).isActive = true
        passwordTextField.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor).isActive = true
        passwordTextField.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        entryButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 28).isActive = true
        entryButton.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor).isActive = true
        entryButton.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor).isActive = true
        entryButton.heightAnchor.constraint(equalToConstant: 70).isActive = true
        
        messageErrorLabel.topAnchor.constraint(equalTo: entryButton.bottomAnchor, constant: 10).isActive = true
        messageErrorLabel.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor).isActive = true
        messageErrorLabel.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor).isActive = true
    }
}
