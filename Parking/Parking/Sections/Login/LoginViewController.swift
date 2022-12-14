//
//  LoginViewController.swift
//  Parking
//
//  Created by Usr_Prime on 16/08/22.
//

import UIKit

class LoginViewController: KeyboardViewController {
    
    private lazy var logoImageView = ParkingLogoImageView()
    
    private lazy var loginLabel: UILabel = {
        let label = UILabel()
        label.text = "Login"
        label.textColor = .black
        label.font = UIFont(name:"Arial Hebrew Bold", size: 25.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var emailTextField = ParkingTextField(text: "Email", type: .Email)
    
    private lazy var passwordTextField = ParkingTextField(text: "Senha", type: .Password)
    
    private lazy var entryButton = ParkingButton(content: "Entrar", type: .primary)
    
    private lazy var messageErrorLabel = ParkingLabel(content: "", size: 17, type: .errorMessage)
    
    private lazy var leftSeparatorView: UIView = {
        let view = UIView()
        view.backgroundColor = Colors.lightGrey
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var registerLabel = ParkingLabel(content: "Cadastre-se".uppercased(),
                                                  size: 19, type: .lightGreyMessage)
    
    private lazy var rightSeparatorView: UIView = {
        let view = UIView()
        view.backgroundColor = Colors.lightGrey
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var registerButton = ParkingButton(content: "Criar Conta".uppercased(), type: .secondary)
    
    let viewModel = LoginViewModel()
    
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
        
        emailTextField.returnKeyType = .next
        emailTextField.delegate = self
        
        passwordTextField.returnKeyType = .done
        passwordTextField.delegate = self
        
        view.addSubview(logoImageView)
        view.addSubview(loginLabel)
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        view.addSubview(entryButton)
        view.addSubview(messageErrorLabel)
        
        view.addSubview(leftSeparatorView)
        view.addSubview(registerLabel)
        view.addSubview(rightSeparatorView)
        
        view.addSubview(registerButton)
    }
    
    private func setupUI() {
        entryButton.addTarget(self, action: #selector(self.validateEntry), for: .touchUpInside)
        registerButton.addTarget(self, action: #selector(self.callRegisterScreen), for: .touchUpInside)
    }
    
    private func setupConstraints() {
        let width = view.frame.width
        logoImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: width/5).isActive = true
        logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        logoImageView.widthAnchor.constraint(equalToConstant: width/2.5).isActive = true
        logoImageView.heightAnchor.constraint(equalToConstant: width/2.5).isActive = true
        
        loginLabel.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: width/6).isActive = true
        loginLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24).isActive = true
        
        emailTextField.topAnchor.constraint(equalTo: loginLabel.bottomAnchor, constant: 10).isActive = true
        emailTextField.leadingAnchor.constraint(equalTo: loginLabel.leadingAnchor).isActive = true
        emailTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24).isActive = true
        emailTextField.heightAnchor.constraint(equalToConstant: width/7).isActive = true
        
        passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 20).isActive = true
        passwordTextField.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor).isActive = true
        passwordTextField.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor).isActive = true
        passwordTextField.heightAnchor.constraint(equalToConstant: width/7).isActive = true
        
        entryButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: width/18).isActive = true
        entryButton.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor).isActive = true
        entryButton.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor).isActive = true
        entryButton.heightAnchor.constraint(equalToConstant: width/6).isActive = true
        
        messageErrorLabel.topAnchor.constraint(equalTo: entryButton.bottomAnchor, constant: 10).isActive = true
        messageErrorLabel.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor).isActive = true
        messageErrorLabel.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor).isActive = true
        
        leftSeparatorView.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor).isActive = true
        leftSeparatorView.widthAnchor.constraint(equalToConstant: view.frame.width/4.8).isActive = true
        leftSeparatorView.heightAnchor.constraint(equalToConstant: 4).isActive = true
        leftSeparatorView.bottomAnchor.constraint(equalTo: registerButton.topAnchor, constant: -width/22).isActive = true
        
        registerLabel.centerYAnchor.constraint(equalTo: leftSeparatorView.centerYAnchor, constant: 2).isActive = true
        registerLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        rightSeparatorView.centerYAnchor.constraint(equalTo: leftSeparatorView.centerYAnchor).isActive = true
        rightSeparatorView.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor).isActive = true
        rightSeparatorView.widthAnchor.constraint(equalToConstant: view.frame.width/4.8).isActive = true
        rightSeparatorView.heightAnchor.constraint(equalToConstant: 4).isActive = true
        
        registerButton.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor).isActive = true
        registerButton.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor).isActive = true
        registerButton.heightAnchor.constraint(equalToConstant: width/7).isActive = true
        registerButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -width/15).isActive = true
    }
    
    @IBAction func validateEntry(_ sender: Any) {
        guard let email = emailTextField.text,
                let password = passwordTextField.text else { return }
        viewModel.validateData(email, and: password)
        authenticateSuccess()
    }
    
    @IBAction func callRegisterScreen(_ sender: Any) {
        let rootController = UINavigationController(rootViewController: RegisterUserViewController())
        rootController.modalPresentationStyle = .fullScreen
        present(rootController, animated: true)
    }
}

extension LoginViewController: LoginViewDelegate {
    func authenticateSuccess() {
        messageErrorLabel.isHidden = true
        let rootController = UINavigationController(rootViewController: HomeViewController())
        rootController.modalPresentationStyle = .fullScreen
        present(rootController, animated: true)
    }
    func authenticateFailed(messageError: String) {
        messageErrorLabel.text = messageError
        messageErrorLabel.isHidden = false
    }
}

extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField.returnKeyType == .next {
            emailTextField.resignFirstResponder()
            passwordTextField.becomeFirstResponder()
        } else {
            passwordTextField.resignFirstResponder()
        }
        return true
    }
}
