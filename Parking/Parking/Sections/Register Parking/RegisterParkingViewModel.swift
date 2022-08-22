//
//  RegisterParkingViewModel.swift
//  Parking
//
//  Created by Usr_Prime on 22/08/22.
//

import Foundation
import UIKit
import TextFieldFormatter

protocol RegisterParkingViewDelegate: AnyObject {
    func showAlertIn(_ field: UITextField)
    func setToDefault()
    func callLogin()
}

public enum TypeValidate {
    case NumVacacions
    case Money1
    case Money2
}

class RegisterParkingViewModel {
    var delegate: RegisterParkingViewDelegate?
    private var canContinue = true
    
    func validateFields(numVacancies: UITextField, oneHourValue: UITextField, addictionalPerHour: UITextField, dayValue: UITextField) {
        self.delegate?.setToDefault()
        canContinue = true
        
        validateField(numVacancies, type: .NumVacacions)
        validateField(oneHourValue, type: .Money2)
        validateField(addictionalPerHour, type: .Money1)
        validateField(dayValue, type: .Money2)
        
        if canContinue { delegate?.callLogin() }
    }
    
    private func validateField(_ field: UITextField, type: TypeValidate) {
        guard let textField = field.text else { return }
        let numVacacions = (textField as NSString).integerValue
        if textField.isEmpty { alert(field) }
        
        switch type {
        case .NumVacacions:
            if numVacacions <= 0 || numVacacions > 1000 { alert(field) }
        case .Money1:
            if textField.count != 8 { alert(field) }
        case .Money2:
            if textField.count != 9 { alert(field) }
        }
    }
    
    private func alert(_ field: UITextField) {
        self.delegate?.showAlertIn(field)
        canContinue = false
    }
}
