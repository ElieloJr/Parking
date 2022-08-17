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
    
    private lazy var leftSeparatorView: UIView = {
        let view = UIView()
        view.backgroundColor = Colors.lightGrey
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var registerLabel: UILabel = {
        let label = UILabel()
        label.text = "Cadastre-se".uppercased()
        label.textColor = Colors.lightGrey
        label.isHidden = false
        label.textAlignment = .center
        label.font = UIFont(name:"Arial Hebrew Bold", size: 19.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var rightSeparatorView: UIView = {
        let view = UIView()
        view.backgroundColor = Colors.lightGrey
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var registerButton = ParkingButton(content: "Criar Conta".uppercased(), type: .secondary)
    
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
        
        view.addSubview(leftSeparatorView)
        view.addSubview(registerLabel)
        view.addSubview(rightSeparatorView)
        
        view.addSubview(registerButton)
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
        
        leftSeparatorView.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor).isActive = true
        leftSeparatorView.widthAnchor.constraint(equalToConstant: view.frame.width/4).isActive = true
        leftSeparatorView.heightAnchor.constraint(equalToConstant: 4).isActive = true
        leftSeparatorView.bottomAnchor.constraint(equalTo: registerButton.topAnchor, constant: -26).isActive = true
        
        registerLabel.centerYAnchor.constraint(equalTo: leftSeparatorView.centerYAnchor, constant: 2).isActive = true
        registerLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        rightSeparatorView.centerYAnchor.constraint(equalTo: leftSeparatorView.centerYAnchor).isActive = true
        rightSeparatorView.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor).isActive = true
        rightSeparatorView.widthAnchor.constraint(equalToConstant: view.frame.width/4).isActive = true
        rightSeparatorView.heightAnchor.constraint(equalToConstant: 4).isActive = true
        
        registerButton.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor).isActive = true
        registerButton.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor).isActive = true
        registerButton.heightAnchor.constraint(equalToConstant: 65).isActive = true
        registerButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50).isActive = true
    }
}
