//
//  RegisterVehicleViewController.swift
//  Parking
//
//  Created by Usr_Prime on 30/08/22.
//

import UIKit

class RegisterVehicleViewController: DefaultViewController {

    private lazy var ownerName = ParkingTextField(text: "Dono", type: .Normal)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupUI()
        setupConstraints()
    }
    
    private func setupView() {
        title = "Cadastrar Veículo"
        
        view.addSubview(ownerName)
    }
    
    private func setupUI() { }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            ownerName.topAnchor.constraint(equalTo: view.topAnchor, constant: 60),
            ownerName.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            ownerName.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            ownerName.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
