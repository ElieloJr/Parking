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

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupUI()
        setupConstraints()
    }
    
    private func setupView() {
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: arrowButton)
        
        view.addSubview(userImageView)
    }
    
    private func setupUI() {
        arrowButton.addTarget(self, action: #selector(backButton), for: .touchUpInside)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            userImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: view.frame.width/4.2),
            userImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            userImageView.widthAnchor.constraint(equalToConstant: view.frame.width/3.2),
            userImageView.heightAnchor.constraint(equalToConstant: view.frame.width/3.2)
        ])
    }
    
    @objc func backButton() {
        dismiss(animated: true, completion: nil)
    }

}
