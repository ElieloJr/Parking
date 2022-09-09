//
//  RegisterUserViewController.swift
//  Parking
//
//  Created by Usr_Prime on 18/08/22.
//

import UIKit
import TextFieldFormatter

class RegisterUserViewController: KeyboardViewController {
    
    private lazy var logoImageView = ParkingLogoImageView()
    
    private lazy var messageToClient = ParkingLabel(content: "Crie uma conta para acessar e gerir seu estacionamento.", size: 19, type: .blueLeftMessage)
    
    private lazy var nameTextField = ParkingTextField(text: "Nome", type: .Normal)
    
    private lazy var lastNameTextField = ParkingTextField(text: "Sobrenome", type: .Normal)
    
    private lazy var CNPJTextField = TextFieldFormatter(placeholder: "CNPJ", type: .CNPJ)
    
    private lazy var emailTextField = ParkingTextField(text: "Email", type: .Email)
    
    private lazy var passwordTextField = ParkingTextField(text: "Senha", type: .Password)
    
    private lazy var confirmPasswordTextField = ParkingTextField(text: "Confirmar Senha", type: .Password)
    
    private lazy var faceIdSwitch = ParkingSwitch(stateStart: true)
    
    private lazy var faceIdLabel = ParkingLabel(content: "Entrar usando FaceID", size: 18, type: .blueLeftMessage)
    
    private lazy var messageErrorLabel = ParkingLabel(content: "", size: 17, type: .errorMessage)
    
    private lazy var nextButton = ParkingButton(content: "Próximo", type: .primary)
    
    private lazy var cancelButton = ParkingButton(content: "Cancelar", type: .terceary)
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    let viewModel = RegisterUserViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupUI()
        configKeyboard()
        setupConstraints()
    }
    
    private func setupView() {
        viewModel.delegate = self
        self.wasKeyboardMoved = true
        navigationController?.isNavigationBarHidden = true
        
        view.addSubview(scrollView)
        
        scrollView.addSubview(logoImageView)
        scrollView.addSubview(messageToClient)
        
        scrollView.addSubview(nameTextField)
        scrollView.addSubview(lastNameTextField)
        scrollView.addSubview(CNPJTextField)
        scrollView.addSubview(emailTextField)
        scrollView.addSubview(passwordTextField)
        scrollView.addSubview(confirmPasswordTextField)
        scrollView.addSubview(faceIdSwitch)
        scrollView.addSubview(faceIdLabel)
        
        scrollView.addSubview(messageErrorLabel)
        scrollView.addSubview(nextButton)
        scrollView.addSubview(cancelButton)
    }
    
    private func setupUI() {
        nextButton.addTarget(self, action: #selector(self.callNextScreen), for: .touchUpInside)
        cancelButton.addTarget(self, action: #selector(self.backScreen), for: .touchUpInside)
    }
    
    private func configKeyboard() {
        nameTextField.returnKeyType = .next
        nameTextField.delegate = self
        
        lastNameTextField.returnKeyType = .next
        lastNameTextField.delegate = self
        
        CNPJTextField.returnKeyType = .next
        CNPJTextField.addToolBar()
        
        emailTextField.returnKeyType = .next
        emailTextField.delegate = self
        
        passwordTextField.returnKeyType = .next
        passwordTextField.delegate = self
        
        confirmPasswordTextField.returnKeyType = .done
        confirmPasswordTextField.delegate = self
    }
    
    private func setupConstraints() {
        let topTextField: CGFloat = 12
        let width = view.frame.width
        
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        logoImageView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: width/9).isActive = true
        logoImageView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 24).isActive = true
        logoImageView.widthAnchor.constraint(equalToConstant: width/3).isActive = true
        logoImageView.heightAnchor.constraint(equalToConstant: width/3).isActive = true
        
        messageToClient.centerYAnchor.constraint(equalTo: logoImageView.centerYAnchor).isActive = true
        messageToClient.leadingAnchor.constraint(equalTo: logoImageView.trailingAnchor, constant: 10).isActive = true
        messageToClient.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -6).isActive = true
        
        nameTextField.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: width/10).isActive = true
        nameTextField.leadingAnchor.constraint(equalTo: logoImageView.leadingAnchor).isActive = true
        nameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24).isActive = true
        nameTextField.heightAnchor.constraint(equalToConstant: width/7).isActive = true
        
        lastNameTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: topTextField).isActive = true
        lastNameTextField.leadingAnchor.constraint(equalTo: nameTextField.leadingAnchor).isActive = true
        lastNameTextField.trailingAnchor.constraint(equalTo: nameTextField.trailingAnchor).isActive = true
        lastNameTextField.heightAnchor.constraint(equalToConstant: width/7).isActive = true
        
        CNPJTextField.topAnchor.constraint(equalTo: lastNameTextField.bottomAnchor, constant: topTextField).isActive = true
        CNPJTextField.leadingAnchor.constraint(equalTo: nameTextField.leadingAnchor).isActive = true
        CNPJTextField.trailingAnchor.constraint(equalTo: nameTextField.trailingAnchor).isActive = true
        CNPJTextField.heightAnchor.constraint(equalToConstant: width/7).isActive = true
        
        emailTextField.topAnchor.constraint(equalTo: CNPJTextField.bottomAnchor, constant: topTextField).isActive = true
        emailTextField.leadingAnchor.constraint(equalTo: nameTextField.leadingAnchor).isActive = true
        emailTextField.trailingAnchor.constraint(equalTo: nameTextField.trailingAnchor).isActive = true
        emailTextField.heightAnchor.constraint(equalToConstant: width/7).isActive = true
        
        passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: topTextField).isActive = true
        passwordTextField.leadingAnchor.constraint(equalTo: nameTextField.leadingAnchor).isActive = true
        passwordTextField.trailingAnchor.constraint(equalTo: nameTextField.trailingAnchor).isActive = true
        passwordTextField.heightAnchor.constraint(equalToConstant: width/7).isActive = true
        
        confirmPasswordTextField.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: topTextField).isActive = true
        confirmPasswordTextField.leadingAnchor.constraint(equalTo: nameTextField.leadingAnchor).isActive = true
        confirmPasswordTextField.trailingAnchor.constraint(equalTo: nameTextField.trailingAnchor).isActive = true
        confirmPasswordTextField.heightAnchor.constraint(equalToConstant: width/7).isActive = true
        
        faceIdSwitch.topAnchor.constraint(equalTo: confirmPasswordTextField.bottomAnchor, constant: topTextField).isActive = true
        faceIdSwitch.leadingAnchor.constraint(equalTo: nameTextField.leadingAnchor).isActive = true
        
        faceIdLabel.centerYAnchor.constraint(equalTo: faceIdSwitch.centerYAnchor, constant: 2).isActive = true
        faceIdLabel.leadingAnchor.constraint(equalTo: faceIdSwitch.trailingAnchor, constant: 10).isActive = true
        
        messageErrorLabel.topAnchor.constraint(equalTo: faceIdSwitch.bottomAnchor, constant: 40).isActive = true
        messageErrorLabel.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor).isActive = true
        messageErrorLabel.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor).isActive = true
        
        nextButton.topAnchor.constraint(equalTo: messageErrorLabel.bottomAnchor, constant: 4).isActive = true
        nextButton.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor).isActive = true
        nextButton.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor).isActive = true
        nextButton.heightAnchor.constraint(equalToConstant: width/7).isActive = true
        
        cancelButton.topAnchor.constraint(equalTo: nextButton.bottomAnchor, constant: 4).isActive = true
        cancelButton.leadingAnchor.constraint(equalTo: nextButton.leadingAnchor).isActive = true
        cancelButton.trailingAnchor.constraint(equalTo: nextButton.trailingAnchor).isActive = true
        cancelButton.heightAnchor.constraint(equalToConstant: width/8).isActive = true
        cancelButton.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -10).isActive = true
    }
    
    @objc func callNextScreen() {
        viewModel.validateFields(name: nameTextField,
                                 lastName: lastNameTextField,
                                 cnpj: CNPJTextField,
                                 email: emailTextField,
                                 password: passwordTextField,
                                 confirmPassword: confirmPasswordTextField)
    }
    
    @objc func backScreen() {
        dismiss(animated: true, completion: nil)
    }
}

extension RegisterUserViewController: RegisterUserViewDelegate {
    func setToDefault() {
        nameTextField.layer.borderWidth = 0
        lastNameTextField.layer.borderWidth = 0
        CNPJTextField.layer.borderWidth = 0
        emailTextField.layer.borderWidth = 0
        passwordTextField.layer.borderWidth = 0
        confirmPasswordTextField.layer.borderWidth = 0
    }
    
    func showAlertIn(_ textField: UITextField) {
        textField.layer.borderColor = UIColor.red.cgColor
        textField.layer.borderWidth = 2
    }
    
    func callRegisterParking() {
        let rootController = UINavigationController(rootViewController: RegisterParkingViewController())
        rootController.modalPresentationStyle = .fullScreen
        present(rootController, animated: true)
    }
}

extension RegisterUserViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == nameTextField {
            nameTextField.resignFirstResponder()
            self.wasKeyboardMoved = true
            self.enableKeyboardUpMovement = false
            lastNameTextField.becomeFirstResponder()
        } else if textField == lastNameTextField {
            lastNameTextField.resignFirstResponder()
            self.wasKeyboardMoved = true
            self.enableKeyboardUpMovement = false
            CNPJTextField.becomeFirstResponder()
        } else if textField == emailTextField {
            emailTextField.resignFirstResponder()
            passwordTextField.becomeFirstResponder()
            self.wasKeyboardMoved = true
            self.enableKeyboardUpMovement = false
        } else if textField == passwordTextField {
            passwordTextField.resignFirstResponder()
            confirmPasswordTextField.becomeFirstResponder()
        } else if textField == confirmPasswordTextField {            confirmPasswordTextField.resignFirstResponder()
        }
        return true
    }
}
