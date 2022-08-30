//
//  RegisterVehicleViewController.swift
//  Parking
//
//  Created by Usr_Prime on 30/08/22.
//

import UIKit

class RegisterVehicleViewController: DefaultViewController {

    private lazy var ownerName = ParkingTextField(text: "Dono", type: .Normal)
    private lazy var model = ParkingTextField(text: "Modelo (Nome do Carro)", type: .Normal)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupUI()
        setupConstraints()
    }
    
    private func setupView() {
        title = "Cadastrar Veículo"
        
        view.addSubview(ownerName)
        view.addSubview(model)
    }
    
    private func setupUI() { }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            ownerName.topAnchor.constraint(equalTo: view.topAnchor, constant: 60),
            ownerName.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            ownerName.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            ownerName.heightAnchor.constraint(equalToConstant: 50),
            
            model.topAnchor.constraint(equalTo: ownerName.bottomAnchor, constant: 10),
            model.leadingAnchor.constraint(equalTo: ownerName.leadingAnchor),
            model.trailingAnchor.constraint(equalTo: ownerName.trailingAnchor),
            model.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
