//
//  ParkingCampView.swift
//  Parking
//
//  Created by Usr_Prime on 02/09/22.
//

import UIKit

enum CampType {
    case Total
    case Collected
    case Status
}

class ParkingCampView: UIView {
    
    private lazy var campNameLabel = ParkingLabel(content: "Carros Hoje".uppercased(), size: 14, type: .whiteMessage)
    
    private lazy var contentLabel = ParkingLabel(content: "19 veículos", size: 22, type: .lightGreyMessage)
    
    private lazy var blueView : UIView = {
        let view = UIView()
        view.backgroundColor = Colors.blue
        view.layer.cornerRadius = 6
        view.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(campNameLabel)
        NSLayoutConstraint.activate([
        campNameLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        campNameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
        campNameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
        return view
    }()
    
    private lazy var whiteView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(contentLabel)
        NSLayoutConstraint.activate([
            contentLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 4),
            contentLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 14),
            contentLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
        return view
    }()

    public convenience init(content: String, type: CampType) {
        self.init(frame: .zero)
        
        switch type {
        case .Total:
            campNameLabel.text = "Carros Hoje".uppercased()
            contentLabel.text = "\(content) veículos"
        case .Collected:
            campNameLabel.text = "Arrecadado Hoje".uppercased()
            contentLabel.text = "R$ \(content)"
        case .Status:
            campNameLabel.text = "Status".uppercased()
            contentLabel.text = ""
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        self.addSubview(whiteView)
        self.addSubview(blueView)
        
        blueView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        blueView.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: -2).isActive = true
        blueView.heightAnchor.constraint(equalToConstant: 22).isActive = true
        
        whiteView.topAnchor.constraint(equalTo: self.topAnchor, constant: 14).isActive = true
        whiteView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        whiteView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        whiteView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
