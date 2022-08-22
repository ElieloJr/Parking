//
//  RegisterParkingViewController.swift
//  Parking
//
//  Created by Usr_Prime on 22/08/22.
//

import UIKit

class RegisterParkingViewController: DefaultViewController {

    private lazy var finishMessageLabel = ParkingLabel(content: "Para concluir o cadastro conte nos mais sobre o seu Estacionamento", size: 20, type: .blueCenterMessage)
    
    private lazy var logoParkingOfUser = ParkingView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupUI()
        setupConstraints()
    }
    
    private func setupView() {
        view.addSubview(finishMessageLabel)
        view.addSubview(logoParkingOfUser)
    }
    
    private func setupUI() {
        logoParkingOfUser.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(selectImageLibrary(_:))))
    }
    
    private func setupConstraints() {
        finishMessageLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 56).isActive = true
        finishMessageLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24).isActive = true
        finishMessageLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24).isActive = true
        
        logoParkingOfUser.topAnchor.constraint(equalTo: finishMessageLabel.bottomAnchor, constant: 30).isActive = true
        logoParkingOfUser.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        logoParkingOfUser.widthAnchor.constraint(equalToConstant: (view.frame.width/2)).isActive = true
        logoParkingOfUser.heightAnchor.constraint(equalToConstant: (view.frame.width/1.8)).isActive = true
    }
    
    @objc func selectImageLibrary(_ sender: UITapGestureRecognizer) {
        let vc = UIImagePickerController()
        vc.sourceType = .photoLibrary
        vc.delegate = self
        vc.allowsEditing = true
        present(vc, animated: true)
    }
}

extension RegisterParkingViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerEditedImage") ] as? UIImage {
            logoParkingOfUser.setLogoImageView(with: image)
        }
        picker.dismiss(animated: true, completion: nil)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}
