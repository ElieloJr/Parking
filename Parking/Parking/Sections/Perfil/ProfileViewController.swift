//
//  PerfilViewController.swift
//  Parking
//
//  Created by Usr_Prime on 02/09/22.
//

import UIKit

class ProfileViewController: DefaultViewController {
    
    private lazy var arrowButton = ParkingBackButton()
    private lazy var userImageView = ParkingLogoImageView()
    private lazy var parkingLabel = ParkingLabel(content: "Estacionamento", size: 16, type: .lightGreyMessage)
    private lazy var parkingNameLabel = ParkingLabel(content: "Nome do Estacionamento", size: 18, type: .darkGreyMessage)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupUI()
        setupConstraints()
    }
    
    private func setupView() {
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: arrowButton)
        
        view.addSubview(userImageView)
        view.addSubview(parkingLabel)
        view.addSubview(parkingNameLabel)
    }
    
    private func setupUI() {
        arrowButton.addTarget(self, action: #selector(backButton), for: .touchUpInside)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            userImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: view.frame.width/4.2),
            userImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            userImageView.widthAnchor.constraint(equalToConstant: view.frame.width/3.2),
            userImageView.heightAnchor.constraint(equalToConstant: view.frame.width/3.2),
            
            parkingLabel.topAnchor.constraint(equalTo: userImageView.topAnchor, constant: 20),
            parkingLabel.leadingAnchor.constraint(equalTo: userImageView.trailingAnchor, constant: 10),
            
            parkingNameLabel.topAnchor.constraint(equalTo: parkingLabel.bottomAnchor),
            parkingNameLabel.leadingAnchor.constraint(equalTo: parkingLabel.leadingAnchor),
            parkingNameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10)
        ])
    }
    
    @objc func backButton() {
        dismiss(animated: true, completion: nil)
    }

}
