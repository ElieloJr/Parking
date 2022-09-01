//
//  TesteViewController.swift
//  Parking
//
//  Created by Usr_Prime on 31/08/22.
//

import UIKit

class TesteViewController: DefaultViewController {

    let viewBackground: UIView = {
        let view = UIView()
        view.backgroundColor = Colors.defaultBackground
        view.layer.cornerRadius = 30
        view.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .clear
        view.addSubview(viewBackground)
        
        viewBackground.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        viewBackground.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        viewBackground.heightAnchor.constraint(equalToConstant: view.frame.height/2).isActive = true
        viewBackground.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
}
