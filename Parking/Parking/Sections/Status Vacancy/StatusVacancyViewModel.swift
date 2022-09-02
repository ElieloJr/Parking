//
//  RegisterVehicleViewModel.swift
//  Parking
//
//  Created by Usr_Prime on 30/08/22.
//

import UIKit

protocol StatusVacancyViewDelegate {
    func showAlertIn(_ field: UITextField)
    func setToDefault()
    func callParking()
}

class StatusVacancyViewModel {
    let colors = ["Preto", "Branco", "Vermelho", "Prata", "Cinza", "Azul", "Marrom", "Verde", "Outra"]
    var delegate: StatusVacancyViewDelegate?
    private var canContinue = true
    var numVacancy: Int = 0
    
    public func validateFields(_ ownerName: UITextField, _ model: UITextField,
                               _ color: UITextField, _ licence: UITextField,
                               _ isMercosul: UISwitch) {
        self.delegate?.setToDefault()
        canContinue = true
        
        validateField(ownerName, type: .Name)
        validateField(model, type: .Name)
        validateField(color, type: .Name)
        if isMercosul.isOn { validateField(licence, type: .LicenseMercosul) }
        else { validateField(licence, type: .LicenseDefault) }
        
        if canContinue {
            delegate?.callParking()
            let newCar = VacancyDetails(isEmpty: false,
                                        numVacancy: numVacancy,
                                        ownerName: ownerName.text!,
                                        model: model.text!,
                                        color: color.text!,
                                        licence: licence.text!)
            print(newCar)
            // TODO: Passar dados pra API aqui
        }
    }
    
    private func validateField(_ field: UITextField, type: TypeField) {
        guard let textField = field.text else { return }
        if textField.isEmpty { alert(field) }
        
        switch type {
        case .Name:
            if textField.count < 3 { alert(field) }
        case .LicenseDefault:
            if textField.count != 8 { alert(field) }
        case .LicenseMercosul:
            if textField.count != 7 { alert(field) }
        case .Email, .CNPJ:
            break
        }
    }
    
    private func alert(_ field: UITextField) {
        self.delegate?.showAlertIn(field)
        canContinue = false
    }
}
