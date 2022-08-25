//
//  HomeViewController.swift
//  Parking
//
//  Created by Usr_Prime on 23/08/22.
//

import UIKit

class HomeViewController: DefaultViewController {

    private lazy var welcomeUser = ParkingHeaderView()
    
    private lazy var statusParking = ParkingStatusView()
    
    override func viewDidAppear(_ animated: Bool) {
        statusParking.addShadow()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupConstraints()
    }
    
    private func setupView() {
        view.addSubview(welcomeUser)
        view.addSubview(statusParking)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            welcomeUser.topAnchor.constraint(equalTo: view.topAnchor, constant: view.frame.width/9),
            welcomeUser.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            welcomeUser.widthAnchor.constraint(equalToConstant: view.frame.width-20),
            
            statusParking.topAnchor.constraint(equalTo: welcomeUser.bottomAnchor, constant: 70),
            statusParking.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            statusParking.widthAnchor.constraint(equalToConstant: view.frame.width),
            statusParking.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
