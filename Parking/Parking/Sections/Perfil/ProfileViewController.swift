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
    private lazy var statusCamp = ParkingCampView(content: "", type: .Status)
    private lazy var historicView : UIView = {
        let campNameLabel = ParkingLabel(content: "Histórico", size: 16, type: .whiteMessage)
        campNameLabel.textAlignment = .center
        let view = UIView()
        view.backgroundColor = Colors.blue
        view.layer.cornerRadius = 6
        view.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(campNameLabel)
        NSLayoutConstraint.activate([
        campNameLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        campNameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
        campNameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10)
        ])
        return view
    }()
    
    private lazy var historicTableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .clear
        tableView.showsVerticalScrollIndicator = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

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
        view.addSubview(statusCamp)
        
        view.addSubview(historicView)
        view.addSubview(historicTableView)
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
            collectedTodayCamp.heightAnchor.constraint(equalToConstant: 54),
            
            statusCamp.topAnchor.constraint(equalTo: carsTodayCamp.bottomAnchor, constant: 10),
            statusCamp.leadingAnchor.constraint(equalTo: carsTodayCamp.leadingAnchor),
            statusCamp.trailingAnchor.constraint(equalTo: collectedTodayCamp.trailingAnchor),
            statusCamp.heightAnchor.constraint(equalToConstant: 60),
            
            historicView.topAnchor.constraint(equalTo: statusCamp.bottomAnchor, constant: 20),
            historicView.leadingAnchor.constraint(equalTo: statusCamp.leadingAnchor),
            historicView.widthAnchor.constraint(equalToConstant: view.frame.width/3),
            historicView.heightAnchor.constraint(equalToConstant: 30),
            
            historicTableView.topAnchor.constraint(equalTo: historicView.bottomAnchor, constant: 10),
            historicTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            historicTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            historicTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    @objc func backButton() {
        dismiss(animated: true, completion: nil)
    }

}
