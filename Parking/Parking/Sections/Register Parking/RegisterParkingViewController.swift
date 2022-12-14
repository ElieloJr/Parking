//
//  RegisterParkingViewController.swift
//  Parking
//
//  Created by Usr_Prime on 22/08/22.
//

import UIKit
import TextFieldFormatter

class RegisterParkingViewController: KeyboardViewController {

    private lazy var finishMessageLabel = ParkingLabel(content: "Para concluir o cadastro conte nos mais sobre o seu Estacionamento", size: 20, type: .blueCenterMessage)
    
    private lazy var logoParkingOfUser = ParkingChooseLogoView()
    
    private lazy var numVacancies = ParkingTextField(text: "Número de Vagas", type: .Number)
    
    private lazy var oneHourValue = TextFieldFormatter(placeholder: "Preço por Hora", type: .Money2)
    
    private lazy var addictionalPerHour = TextFieldFormatter(placeholder: "Adicional por Hora", type: .Money1)
    
    private lazy var dayValue = TextFieldFormatter(placeholder: "Preço Diária", type: .Money2)
    
    private lazy var messageError = ParkingLabel(content: "Preencha todos os campos", size: 19, type: .errorMessage)
    
    private lazy var finishButton = ParkingButton(content: "Finalizar", type: .primary)
    
    private lazy var backButton = ParkingButton(content: "Voltar", type: .terceary)
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    lazy var viewModel = RegisterParkingViewModel()
    
    override func viewDidAppear(_ animated: Bool) {
        self.wasKeyboardMoved = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupUI()
        setupConstraints()
    }
    
    private func setupView() {
        viewModel.delegate = self
        navigationController?.isNavigationBarHidden = true
        
        view.addSubview(scrollView)
        
        numVacancies.addToolBar()
        oneHourValue.addToolBar()
        addictionalPerHour.addToolBar()
        dayValue.addToolBar()
        
        scrollView.addSubview(finishMessageLabel)
        scrollView.addSubview(logoParkingOfUser)
        
        scrollView.addSubview(numVacancies)
        scrollView.addSubview(oneHourValue)
        scrollView.addSubview(addictionalPerHour)
        scrollView.addSubview(dayValue)
        scrollView.addSubview(messageError)
        
        scrollView.addSubview(finishButton)
        scrollView.addSubview(backButton)
    }
    
    private func setupUI() {
        logoParkingOfUser.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(selectImageLibrary(_:))))
        finishButton.addTarget(self, action: #selector(self.callNextScreen), for: .touchUpInside)
        backButton.addTarget(self, action: #selector(self.backScreen), for: .touchUpInside)
    }
    
    private func setupConstraints() {
        let topTextField: CGFloat = 12
        let width = view.frame.width
        
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        finishMessageLabel.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: width/12).isActive = true
        finishMessageLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24).isActive = true
        finishMessageLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24).isActive = true
        
        logoParkingOfUser.topAnchor.constraint(equalTo: finishMessageLabel.bottomAnchor, constant: 30).isActive = true
        logoParkingOfUser.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        logoParkingOfUser.widthAnchor.constraint(equalToConstant: (view.frame.width/2)).isActive = true
        logoParkingOfUser.heightAnchor.constraint(equalToConstant: (view.frame.width/1.8)).isActive = true
        
        numVacancies.topAnchor.constraint(equalTo: logoParkingOfUser.bottomAnchor, constant: 30).isActive = true
        numVacancies.leadingAnchor.constraint(equalTo: finishMessageLabel.leadingAnchor).isActive = true
        numVacancies.trailingAnchor.constraint(equalTo: finishMessageLabel.trailingAnchor).isActive = true
        numVacancies.heightAnchor.constraint(equalToConstant: width/7).isActive = true
        
        oneHourValue.topAnchor.constraint(equalTo: numVacancies.bottomAnchor, constant: topTextField).isActive = true
        oneHourValue.leadingAnchor.constraint(equalTo: finishMessageLabel.leadingAnchor).isActive = true
        oneHourValue.trailingAnchor.constraint(equalTo: finishMessageLabel.trailingAnchor).isActive = true
        oneHourValue.heightAnchor.constraint(equalToConstant: width/7).isActive = true
        
        addictionalPerHour.topAnchor.constraint(equalTo: oneHourValue.bottomAnchor, constant: topTextField).isActive = true
        addictionalPerHour.leadingAnchor.constraint(equalTo: finishMessageLabel.leadingAnchor).isActive = true
        addictionalPerHour.trailingAnchor.constraint(equalTo: finishMessageLabel.trailingAnchor).isActive = true
        addictionalPerHour.heightAnchor.constraint(equalToConstant: width/7).isActive = true
        
        dayValue.topAnchor.constraint(equalTo: addictionalPerHour.bottomAnchor, constant: topTextField).isActive = true
        dayValue.leadingAnchor.constraint(equalTo: finishMessageLabel.leadingAnchor).isActive = true
        dayValue.trailingAnchor.constraint(equalTo: finishMessageLabel.trailingAnchor).isActive = true
        dayValue.heightAnchor.constraint(equalToConstant: width/7).isActive = true
        
        messageError.topAnchor.constraint(equalTo: dayValue.bottomAnchor, constant: 4).isActive = true
        messageError.leadingAnchor.constraint(equalTo: finishMessageLabel.leadingAnchor).isActive = true
        messageError.trailingAnchor.constraint(equalTo: finishMessageLabel.trailingAnchor).isActive = true
        
        finishButton.topAnchor.constraint(equalTo: messageError.bottomAnchor, constant: width/12).isActive = true
        finishButton.leadingAnchor.constraint(equalTo: finishMessageLabel.leadingAnchor).isActive = true
        finishButton.trailingAnchor.constraint(equalTo: finishMessageLabel.trailingAnchor).isActive = true
        finishButton.heightAnchor.constraint(equalToConstant: width/7).isActive = true
        
        backButton.topAnchor.constraint(equalTo: finishButton.bottomAnchor, constant: 4).isActive = true
        backButton.leadingAnchor.constraint(equalTo: finishMessageLabel.leadingAnchor).isActive = true
        backButton.trailingAnchor.constraint(equalTo: finishMessageLabel.trailingAnchor).isActive = true
        backButton.heightAnchor.constraint(equalToConstant: width/8).isActive = true
        backButton.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -10).isActive = true
    }
    
    @objc func selectImageLibrary(_ sender: UITapGestureRecognizer) {
        let vc = UIImagePickerController()
        vc.sourceType = .photoLibrary
        vc.delegate = self
        vc.allowsEditing = true
        present(vc, animated: true)
    }
    
    @objc func callNextScreen() {
        print("Call LoginViewController")
        viewModel.validateFields(numVacancies: numVacancies, oneHourValue: oneHourValue, addictionalPerHour: addictionalPerHour, dayValue: dayValue)
    }
    
    @objc func backScreen() {
        dismiss(animated: true, completion: nil)
    }
}

extension RegisterParkingViewController: RegisterParkingViewDelegate {
    func showAlertIn(_ field: UITextField) {
        field.layer.borderColor = UIColor.red.cgColor
        field.layer.borderWidth = 2
    }
    
    func setToDefault() {
        numVacancies.layer.borderWidth = 0
        oneHourValue.layer.borderWidth = 0
        addictionalPerHour.layer.borderWidth = 0
        dayValue.layer.borderWidth = 0
    }
    
    func callLogin() {
        let rootController = UINavigationController(rootViewController: LoginViewController())
        rootController.modalPresentationStyle = .fullScreen
        present(rootController, animated: true)
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
