//
//  VacancyCollectionViewCell.swift
//  Parking
//
//  Created by Usr_Prime on 26/08/22.
//

import UIKit

enum PositionVacancy {
    case Left
    case Right
}

class VacancyCollectionViewCell: UICollectionViewCell {
    static let identifier = "VacancyCollectionViewCell"
    
    private var topLine = ParkingSeparatorView(color: Colors.lightGrey)
    private var endLine = ParkingSeparatorView(color: Colors.lightGrey)
    private var bottomLine = ParkingSeparatorView(color: Colors.lightGrey)
    
    private var vacancyEmpty: UIView = {
        let view = UIView()
        view.backgroundColor = Colors.blue
        view.layer.cornerRadius = 14
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var numVacancy = ParkingLabel(content: "V00", size: 26, type: .whiteMessage)
    private var license = ParkingLabel(content: "HHH-0000", size: 16, type: .whiteMessage)
    
    private var carImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "LeftCar")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    public convenience init(color: UIColor) {
        self.init(frame: .zero)
        
        self.backgroundColor = color
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(topLine)
        self.addSubview(bottomLine)
        self.addSubview(vacancyEmpty)
        self.addSubview(numVacancy)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        NSLayoutConstraint.activate([
            topLine.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            topLine.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            topLine.widthAnchor.constraint(equalToConstant: self.frame.width/1.15),
            topLine.heightAnchor.constraint(equalToConstant: 2),
            
            bottomLine.leadingAnchor.constraint(equalTo: topLine.leadingAnchor),
            bottomLine.widthAnchor.constraint(equalToConstant: self.frame.width/1.15),
            bottomLine.heightAnchor.constraint(equalToConstant: 2),
            bottomLine.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5),
            
            numVacancy.centerXAnchor.constraint(equalTo: vacancyEmpty.centerXAnchor),
            numVacancy.centerYAnchor.constraint(equalTo: vacancyEmpty.centerYAnchor, constant: 4),
            
            vacancyEmpty.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            vacancyEmpty.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            vacancyEmpty.widthAnchor.constraint(equalToConstant: self.frame.width/1.2),
            vacancyEmpty.heightAnchor.constraint(equalToConstant: self.frame.height/1.5)
        ])
    }
    
    func configureCell(position: Int, vacancy: ParkingApiResponse) {
        if ((position%2) == 0) {
            positionCar(vacancy: vacancy, position: .Left)
        } else {
            positionCar(vacancy: vacancy, position: .Right)
        }
        
        if position < 10 { numVacancy.text = "V0\(position)" }
        else { numVacancy.text = "V\(position)" }
    }
    
    func positionCar(vacancy: ParkingApiResponse, position: PositionVacancy) {
        switch position {
        case .Left:
            occupiedVacancy(verify: vacancy)
            
        case .Right:
            carImage.image = UIImage(named: "RightCar")
            occupiedVacancy(verify: vacancy)
        }
    }
    
    func occupiedVacancy(verify: ParkingApiResponse) {
        if !verify.license.isEmpty {
            license.text = verify.license
            self.addSubview(carImage)
            self.addSubview(license)
            
            NSLayoutConstraint.activate([
                carImage.topAnchor.constraint(equalTo: vacancyEmpty.topAnchor, constant: -6),
                carImage.leadingAnchor.constraint(equalTo: vacancyEmpty.leadingAnchor),
                carImage.trailingAnchor.constraint(equalTo: vacancyEmpty.trailingAnchor),
                carImage.heightAnchor.constraint(equalToConstant: self.frame.height/1.75),
                
                license.topAnchor.constraint(equalTo: carImage.bottomAnchor),
                license.centerXAnchor.constraint(equalTo: carImage.centerXAnchor)
            ])
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
