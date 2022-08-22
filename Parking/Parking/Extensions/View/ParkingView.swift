//
//  ParkingView.swift
//  Parking
//
//  Created by Usr_Prime on 22/08/22.
//

import UIKit

class ParkingView: UIView {
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.backgroundColor = Colors.blue
        imageView.tintColor = Colors.lightGrey
        imageView.layer.cornerRadius = self.frame.width/13
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var label = ParkingLabel(content: "Seu Logo", size: 19, type: .blueCenterMessage)

    public convenience init() {
        self.init(frame: .zero)
        
        self.clipsToBounds = true
        self.layer.cornerRadius = 10
        self.backgroundColor = .white
        self.translatesAutoresizingMaskIntoConstraints = false
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(imageView)
        self.addSubview(label)
        setupConstraints()
    }
    
    private func setupConstraints() {
        imageView.topAnchor.constraint(equalTo: self.topAnchor, constant: -2).isActive = true
        imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: label.topAnchor, constant: -10).isActive = true
        
        label.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        label.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        label.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -4).isActive = true
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setLogoImageView(with image: UIImage) {
        imageView.image = image
    }
}
