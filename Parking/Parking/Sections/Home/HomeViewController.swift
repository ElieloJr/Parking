//
//  HomeViewController.swift
//  Parking
//
//  Created by Usr_Prime on 23/08/22.
//

import UIKit

class HomeViewController: DefaultViewController {

    private lazy var welcomeUser = ParkingHeaderView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupConstraints()
    }
    
    private func setupView() {
        view.addSubview(welcomeUser)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            welcomeUser.topAnchor.constraint(equalTo: view.topAnchor, constant: view.frame.width/9),
            welcomeUser.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            welcomeUser.widthAnchor.constraint(equalToConstant: view.frame.width-20)
        ])
    }
}
