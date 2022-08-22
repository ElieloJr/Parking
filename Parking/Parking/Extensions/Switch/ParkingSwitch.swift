//
//  ParkingSwitch.swift
//  Parking
//
//  Created by Usr_Prime on 19/08/22.
//

import UIKit

class ParkingSwitch: UISwitch {

    public convenience init(stateStart: Bool) {
        self.init(frame: .zero)
        
        self.onTintColor = Colors.blue
        self.isOn = stateStart
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
