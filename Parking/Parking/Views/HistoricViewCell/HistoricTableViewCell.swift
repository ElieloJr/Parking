//
//  HistoricTableViewCell.swift
//  Parking
//
//  Created by Usr_Prime on 05/09/22.
//

import UIKit

class HistoricTableViewCell: UITableViewCell {
    static let identifier = "HistoricTableViewCell"
    
    private let whiteView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 10
        view.backgroundColor = .white
        
        view.layer.shadowOpacity = 0.2
        view.layer.shadowRadius = 2.0
        view.layer.shadowOffset = CGSize(width: 1, height: 3)
        view.layer.shadowColor = UIColor.black.cgColor
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let ownerName = ParkingLabel(content: "Nome do Dono",
                                         size: 16,
                                         type: .lightGreyMessage)
    private let licence = ParkingLabel(content: "HHH-8888", size: 24, type: .blueCenterMessage)
    private let model = ParkingLabel(content: "Modelo (Cor)", size: 16, type: .lightGreyMessage)
    private let separator = ParkingSeparatorView(color: .lightGray)
    private let value = ParkingLabel(content: "R$ 5,00", size: 22, type: .blueCenterMessage)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .clear
        
        self.addSubview(whiteView)
        whiteView.addSubview(ownerName)
        whiteView.addSubview(licence)
        whiteView.addSubview(model)
        
        whiteView.addSubview(separator)
        whiteView.addSubview(value)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        ownerName.font = ownerName.font.withSize(self.frame.height/2.5)
        licence.font = licence.font.withSize(self.frame.height/1.8)
        model.font = model.font.withSize(self.frame.height/2.5)
        value.font = value.font.withSize(self.frame.height/2)
        
        let height = self.frame.height
        
        NSLayoutConstraint.activate([
            whiteView.topAnchor.constraint(equalTo: self.topAnchor),
            whiteView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            whiteView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            whiteView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -height/5),
            
            ownerName.topAnchor.constraint(equalTo: whiteView.topAnchor, constant: height/6),
            ownerName.leadingAnchor.constraint(equalTo: whiteView.leadingAnchor, constant: 10),
            
            licence.centerYAnchor.constraint(equalTo: whiteView.centerYAnchor),
            licence.leadingAnchor.constraint(equalTo: ownerName.leadingAnchor, constant: 6),
            
            model.leadingAnchor.constraint(equalTo: ownerName.leadingAnchor),
            model.bottomAnchor.constraint(equalTo: whiteView.bottomAnchor, constant: -height/6),
            
            value.centerYAnchor.constraint(equalTo: whiteView.centerYAnchor),
            value.trailingAnchor.constraint(equalTo: whiteView.trailingAnchor, constant: -15),
            
            separator.topAnchor.constraint(equalTo: whiteView.topAnchor, constant: 10),
            separator.trailingAnchor.constraint(equalTo: value.leadingAnchor, constant: -10),
            separator.widthAnchor.constraint(equalToConstant: 2),
            separator.bottomAnchor.constraint(equalTo: whiteView.bottomAnchor, constant: -10)
        ])
    }
    
    public func configureCell(with car: VacancyDetails) {
        ownerName.text = car.ownerName
        licence.text = car.licence
        model.text = "\(car.model) (\(car.color))"
        value.text = "R$ 0,00"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
