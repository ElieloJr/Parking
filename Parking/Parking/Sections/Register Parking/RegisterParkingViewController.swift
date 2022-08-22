//
//  RegisterParkingViewController.swift
//  Parking
//
//  Created by Usr_Prime on 22/08/22.
//

import UIKit
import TextFieldFormatter

class RegisterParkingViewController: DefaultViewController {

    private lazy var finishMessageLabel = ParkingLabel(content: "Para concluir o cadastro conte nos mais sobre o seu Estacionamento", size: 20, type: .blueCenterMessage)
    
    private lazy var logoParkingOfUser = ParkingView()
    
    private lazy var numVacancies = ParkingTextField(text: "Número de Vagas", type: .Number)
    
    private lazy var oneHourValue = TextFieldFormatter(placeholder: "Preço por Hora", type: .Money2)
    
    private lazy var addictionalPerHour = TextFieldFormatter(placeholder: "Adicional por Hora", type: .Money1)
    
    private lazy var dayValue = TextFieldFormatter(placeholder: "Preço Diária", type: .Money2)
    
    private lazy var messageError = ParkingLabel(content: "Preencha todos os campos", size: 19, type: .errorMessage)
    
    private lazy var finishButton = ParkingButton(content: "Finalizar", type: .primary)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupUI()
        setupConstraints()
    }
    
    private func setupView() {
        view.addSubview(finishMessageLabel)
        view.addSubview(logoParkingOfUser)
        
        view.addSubview(numVacancies)
        view.addSubview(oneHourValue)
        view.addSubview(addictionalPerHour)
        view.addSubview(dayValue)
        view.addSubview(messageError)
        
        view.addSubview(finishButton)
    }
    
    private func setupUI() {
        logoParkingOfUser.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(selectImageLibrary(_:))))
    }
    
    private func setupConstraints() {
        let topTextField: CGFloat = 12
        let heightTextField: CGFloat = 60
        
        finishMessageLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 56).isActive = true
        finishMessageLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24).isActive = true
        finishMessageLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24).isActive = true
        
        logoParkingOfUser.topAnchor.constraint(equalTo: finishMessageLabel.bottomAnchor, constant: 30).isActive = true
        logoParkingOfUser.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        logoParkingOfUser.widthAnchor.constraint(equalToConstant: (view.frame.width/2)).isActive = true
        logoParkingOfUser.heightAnchor.constraint(equalToConstant: (view.frame.width/1.8)).isActive = true
        
        numVacancies.topAnchor.constraint(equalTo: logoParkingOfUser.bottomAnchor, constant: 30).isActive = true
        numVacancies.leadingAnchor.constraint(equalTo: finishMessageLabel.leadingAnchor).isActive = true
        numVacancies.trailingAnchor.constraint(equalTo: finishMessageLabel.trailingAnchor).isActive = true
        numVacancies.heightAnchor.constraint(equalToConstant: heightTextField).isActive = true
        
        oneHourValue.topAnchor.constraint(equalTo: numVacancies.bottomAnchor, constant: topTextField).isActive = true
        oneHourValue.leadingAnchor.constraint(equalTo: finishMessageLabel.leadingAnchor).isActive = true
        oneHourValue.trailingAnchor.constraint(equalTo: finishMessageLabel.trailingAnchor).isActive = true
        oneHourValue.heightAnchor.constraint(equalToConstant: heightTextField).isActive = true
        
        addictionalPerHour.topAnchor.constraint(equalTo: oneHourValue.bottomAnchor, constant: topTextField).isActive = true
        addictionalPerHour.leadingAnchor.constraint(equalTo: finishMessageLabel.leadingAnchor).isActive = true
        addictionalPerHour.trailingAnchor.constraint(equalTo: finishMessageLabel.trailingAnchor).isActive = true
        addictionalPerHour.heightAnchor.constraint(equalToConstant: heightTextField).isActive = true
        
        dayValue.topAnchor.constraint(equalTo: addictionalPerHour.bottomAnchor, constant: topTextField).isActive = true
        dayValue.leadingAnchor.constraint(equalTo: finishMessageLabel.leadingAnchor).isActive = true
        dayValue.trailingAnchor.constraint(equalTo: finishMessageLabel.trailingAnchor).isActive = true
        dayValue.heightAnchor.constraint(equalToConstant: heightTextField).isActive = true
        
        messageError.topAnchor.constraint(equalTo: dayValue.bottomAnchor, constant: 4).isActive = true
        messageError.leadingAnchor.constraint(equalTo: finishMessageLabel.leadingAnchor).isActive = true
        messageError.trailingAnchor.constraint(equalTo: finishMessageLabel.trailingAnchor).isActive = true
        
        finishButton.topAnchor.constraint(equalTo: messageError.bottomAnchor, constant: 50).isActive = true
        finishButton.leadingAnchor.constraint(equalTo: finishMessageLabel.leadingAnchor).isActive = true
        finishButton.trailingAnchor.constraint(equalTo: finishMessageLabel.trailingAnchor).isActive = true
        finishButton.heightAnchor.constraint(equalToConstant: 70).isActive = true
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
