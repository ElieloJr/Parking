//
//  LoginViewModel.swift
//  Parking
//
//  Created by Usr_Prime on 16/08/22.
//

import Foundation

protocol LoginViewDelegate {
    func authenticateSuccess()
    func authenticateFailed(messageError: String)
}

class LoginViewModel {
    var delegate: LoginViewDelegate?
    
    func validateData(_ email: String, and password: String) {
        if !email.isEmpty && !password.isEmpty {
            delegate?.authenticateSuccess()
        } else if email.isEmpty || password.isEmpty {
            delegate?.authenticateFailed(messageError: "Preencha todos os campos")
        } else {
            delegate?.authenticateFailed(messageError: "Email ou senha inválido")
        }
    }
}
