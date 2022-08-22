//
//  ParkingLogoImageView.swift
//  Parking
//
//  Created by Usr_Prime on 18/08/22.
//

import UIKit

class ParkingLogoImageView: UIImageView {

    public convenience init() {
        self.init(frame: .zero)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .blue
        self.image = UIImage(named: "Parking_icon")
        self.layer.cornerRadius = 16
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
