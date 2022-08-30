//
//  ParkingSeparatorView.swift
//  Parking
//
//  Created by Usr_Prime on 26/08/22.
//

import UIKit

class ParkingSeparatorView: UIView {

    public convenience init(color: UIColor) {
        self.init(frame: .zero)
        
        self.backgroundColor = color
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
