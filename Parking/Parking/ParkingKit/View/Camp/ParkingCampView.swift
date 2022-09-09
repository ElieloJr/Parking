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
    
    private lazy var campNameLabel = ParkingLabel(content: "Carros Hoje".uppercased(), size: 12, type: .whiteMessage)
    private lazy var contentLabel = ParkingLabel(content: "19 veículos", size: 20, type: .lightGreyMessage)
    
    private lazy var blueView : UIView = {
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
    
    private lazy var whiteView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    public convenience init(content: String, type: CampType) {
        self.init(frame: .zero)
        
        switch type {
        case .Total:
            contentCenter(title: "Carros Hoje")
            contentLabel.text = "\(content) veículos"
        case .Collected:
            contentCenter(title: "Arrecadado Hoje")
            contentLabel.text = "R$ \(content)"
        case .Status:
            statusBar(ocuppedVacancy: 3, freeVacancy: 7)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        self.addSubview(whiteView)
        self.addSubview(blueView)
        
        blueView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        blueView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        blueView.heightAnchor.constraint(equalToConstant: 22).isActive = true
        
        whiteView.topAnchor.constraint(equalTo: self.topAnchor, constant: 14).isActive = true
        whiteView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        whiteView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        whiteView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func contentCenter(title: String) {
        campNameLabel.text = title.uppercased()
        whiteView.addSubview(contentLabel)
        
        NSLayoutConstraint.activate([
            contentLabel.centerYAnchor.constraint(equalTo: whiteView.centerYAnchor, constant: 4),
            contentLabel.leadingAnchor.constraint(equalTo: whiteView.leadingAnchor, constant: 14),
            contentLabel.trailingAnchor.constraint(equalTo: whiteView.trailingAnchor, constant: -16)
        ])
    }
    
    private func statusBar(ocuppedVacancy: Int, freeVacancy: Int) {
        campNameLabel.text = "Status".uppercased()
        
        let ocupped = ParkingLabel(content: "Preenchidas:", size: 18, type: .lightGreyMessage)
        let ocuppedValue = ParkingLabel(content: "\(ocuppedVacancy)", size: 18, type: .lightGreyMessage)
        ocuppedValue.textColor = Colors.darkGrey
        
        let free = ParkingLabel(content: "Disponíveis:", size: 18, type: .lightGreyMessage)
        let freeValue = ParkingLabel(content: "\(freeVacancy)", size: 18, type: .lightGreyMessage)
        freeValue.textColor = Colors.darkGrey
        
        whiteView.addSubview(ocupped)
        whiteView.addSubview(ocuppedValue)
        whiteView.addSubview(freeValue)
        whiteView.addSubview(free)
        
        NSLayoutConstraint.activate([
            ocupped.centerYAnchor.constraint(equalTo: whiteView.centerYAnchor, constant: 2),
            ocupped.leadingAnchor.constraint(equalTo: whiteView.leadingAnchor, constant: 20),
            
            ocuppedValue.centerYAnchor.constraint(equalTo: ocupped.centerYAnchor),
            ocuppedValue.leadingAnchor.constraint(equalTo: ocupped.trailingAnchor, constant: 4),
            
            freeValue.centerYAnchor.constraint(equalTo: ocupped.centerYAnchor),
            freeValue.trailingAnchor.constraint(equalTo: whiteView.trailingAnchor, constant: -20),
            
            free.centerYAnchor.constraint(equalTo: ocupped.centerYAnchor),
            free.trailingAnchor.constraint(equalTo: freeValue.leadingAnchor, constant: -4),
        ])
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
