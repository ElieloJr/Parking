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
    private lazy var employeeLabel = ParkingLabel(content: "Funcionário", size: 16, type: .lightGreyMessage)
    private lazy var meliantNameLabel = ParkingLabel(content: "Nome do Meliante", size: 18, type: .darkGreyMessage)
    private lazy var carsTodayCamp = ParkingCampView(content: "19", type: .Total)
    private lazy var collectedTodayCamp = ParkingCampView(content: "100,00", type: .Collected)

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
        view.addSubview(employeeLabel)
        view.addSubview(meliantNameLabel)
        view.addSubview(carsTodayCamp)
        view.addSubview(collectedTodayCamp)
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
            parkingNameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            
            employeeLabel.topAnchor.constraint(equalTo: parkingNameLabel.bottomAnchor, constant: 10),
            employeeLabel.leadingAnchor.constraint(equalTo: parkingLabel.leadingAnchor),
            
            meliantNameLabel.topAnchor.constraint(equalTo: employeeLabel.bottomAnchor),
            meliantNameLabel.leadingAnchor.constraint(equalTo: parkingLabel.leadingAnchor),
            meliantNameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            
            carsTodayCamp.topAnchor.constraint(equalTo: userImageView.bottomAnchor, constant: 10),
            carsTodayCamp.leadingAnchor.constraint(equalTo: userImageView.leadingAnchor),
            carsTodayCamp.widthAnchor.constraint(equalToConstant: view.frame.width/2.3),
            carsTodayCamp.heightAnchor.constraint(equalToConstant: 54),
            
            collectedTodayCamp.centerYAnchor.constraint(equalTo: carsTodayCamp.centerYAnchor),
            collectedTodayCamp.leadingAnchor.constraint(equalTo: carsTodayCamp.trailingAnchor, constant: 10),
            collectedTodayCamp.widthAnchor.constraint(equalToConstant: view.frame.width/2.3),
            collectedTodayCamp.heightAnchor.constraint(equalToConstant: 54)
        ])
    }
    
    @objc func backButton() {
        dismiss(animated: true, completion: nil)
    }

}
