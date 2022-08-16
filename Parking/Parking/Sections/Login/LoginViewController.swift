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
    
    private lazy var textfield = ParkingTextField(text: "Email")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupConstraints()
    }

    private func setupView() {
        view.addSubview(logoImageView)
        view.addSubview(loginLabel)
        view.addSubview(textfield)
    }
    
    private func setupConstraints() {
        logoImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 130).isActive = true
        logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        logoImageView.widthAnchor.constraint(equalToConstant: 150).isActive = true
        logoImageView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        
        loginLabel.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 100).isActive = true
        loginLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24).isActive = true
        
        textfield.topAnchor.constraint(equalTo: loginLabel.bottomAnchor, constant: 10).isActive = true
        textfield.leadingAnchor.constraint(equalTo: loginLabel.leadingAnchor).isActive = true
        textfield.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24).isActive = true
        textfield.heightAnchor.constraint(equalToConstant: 60).isActive = true
    }
}
