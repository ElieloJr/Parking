//
//  ParkingStatusView.swift
//  Parking
//
//  Created by Usr_Prime on 24/08/22.
//

import UIKit

class ParkingStatusView: UIView {
    
    private lazy var vacanciesFilled = ParkingLabel(content: "Preenchidas:",
                                                   size: 16, type: .lightGreyMessage)
    
    private lazy var vacanciesFilledValue = ParkingLabel(content: "3",
                                                         size: 25, type: .darkGreyMessage)
    
    private lazy var separatorView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black
        return view
    }()
    
    private lazy var vacanciesAvailable = ParkingLabel(content: "Disponíveis:",
                                                      size: 16, type: .lightGreyMessage)
    
    private lazy var vacanciesAvailableValue = ParkingLabel(content: "7",
                                                         size: 25, type: .darkGreyMessage)

    public convenience init() {
        self.init(frame: .zero)
        
        self.layer.cornerRadius = 20
        self.backgroundColor = .white
        self.layer.masksToBounds = false
        self.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        self.translatesAutoresizingMaskIntoConstraints = false
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(vacanciesFilled)
        self.addSubview(separatorView)
        
        self.addSubview(vacanciesFilledValue)
        
        self.addSubview(vacanciesAvailable)
        self.addSubview(vacanciesAvailableValue)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            vacanciesFilled.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            vacanciesFilled.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30),
            
            vacanciesFilledValue.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            vacanciesFilledValue.leadingAnchor.constraint(equalTo: vacanciesFilled.trailingAnchor, constant: 6),
            
            separatorView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            separatorView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            separatorView.widthAnchor.constraint(equalToConstant: 2),
            separatorView.heightAnchor.constraint(equalToConstant: 20),
            
            vacanciesAvailable.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            vacanciesAvailable.leadingAnchor.constraint(equalTo: separatorView.trailingAnchor, constant: 30),
            
            vacanciesAvailableValue.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            vacanciesAvailableValue.leadingAnchor.constraint(equalTo: vacanciesAvailable.trailingAnchor, constant: 6)
        ])
    }
    
    func addShadow() {
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.1
        self.layer.shadowOffset = CGSize(width: 1, height: 3)
        self.layer.shadowRadius = 2
        self.layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        self.layer.shouldRasterize = true
        self.layer.rasterizationScale = UIScreen.main.scale
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
