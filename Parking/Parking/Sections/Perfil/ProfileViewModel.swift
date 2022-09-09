//
//  PerfilViewModel.swift
//  Parking
//
//  Created by Usr_Prime on 02/09/22.
//

import Foundation

protocol ProfileViewDelegate {
    func reloadData()
}

class ProfileViewModel {
    public var historicCars: [VacancyDetails] = []
    public var delegate: ProfileViewDelegate?
    
    public func filterVacancies() {
        historicCars = []
        for vacancy in Data.parkingStatus {
            if !vacancy.isEmpty { historicCars.append(vacancy) }
        }
        delegate?.reloadData()
    }
}
