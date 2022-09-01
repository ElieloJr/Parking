//
//  RegisterUserViewModel.swift
//  Parking
//
//  Created by Usr_Prime on 18/08/22.
//

import Foundation
import CloudKit
import UIKit

enum TypeField {
    case Name
    case CNPJ
    case Email
    case LicenseDefault
    case LicenseMercosul
}

protocol RegisterUserViewDelegate: AnyObject {
    func showAlertIn(_ textField: UITextField)
    func setToDefault()
    func callRegisterParking()
}

class RegisterUserViewModel {
    var delegate: RegisterUserViewDelegate?
    private var canContinue = true
    
    func validateFields(name: UITextField, lastName: UITextField, cnpj: UITextField, email: UITextField, password: UITextField, confirmPassword: UITextField) {
        self.delegate?.setToDefault()
        canContinue = true
        
        validateField(name, type: .Name)
        validateField(lastName, type: .Name)
        validateField(cnpj, type: .CNPJ)
        validateField(email, type: .Email)
        validatePassword(with: password, and: confirmPassword)
        
        if canContinue { delegate?.callRegisterParking() }
    }
    
    private func validateField(_ field: UITextField, type: TypeField) {
        guard let textField = field.text else { return }
        if textField.isEmpty { alert(field) }
        
        switch type {
        case .Name:
            if textField.count < 3 { alert(field) }
        case .CNPJ:
            if textField.count != 18 { alert(field) }
        case .Email:
            if !isValidFormatEmail(textField) { alert(field) }
        case .LicenseDefault, .LicenseMercosul:
            break
        }
    }
    
    private func validatePassword(with password: UITextField, and confirmPassword: UITextField) {
        guard let textPassword = password.text,
                let textConfirmPassword = confirmPassword.text else { return }
        if textPassword.count < 8 || textConfirmPassword.count < 8 ||
            textPassword != textConfirmPassword {
            alert(password)
            alert(confirmPassword)
        }
    }
    
    private func alert(_ field: UITextField) {
        self.delegate?.showAlertIn(field)
        canContinue = false
    }
    
    private func isValidFormatEmail(_ email: String) -> Bool{
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
}
