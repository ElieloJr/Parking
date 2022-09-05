//
//  ParkingBackButton.swift
//  Parking
//
//  Created by Usr_Prime on 02/09/22.
//

import UIKit

class ParkingBackButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: CGRect(x: 0, y: 0, width: 30, height: 20))
        
        self.setImage(UIImage(systemName: "arrow.left"), for: .normal)
        self.tintColor = Colors.blue
        self.contentVerticalAlignment = .fill
        self.contentHorizontalAlignment = .fill
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
