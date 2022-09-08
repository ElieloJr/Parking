//
//  HomeViewModel.swift
//  Parking
//
//  Created by Usr_Prime on 23/08/22.
//

import Foundation

class HomeViewModel {
    
    public var parking: [VacancyDetails] = Data.parkingStatus
    public var vacanciesFilled = 0
    public var vacanciesAvailable = 0
    
    public func filterVacancies() {
        vacanciesFilled = 0
        vacanciesAvailable = 0
        
        for park in parking {
            if !park.isEmpty { vacanciesFilled += 1 }
            else { vacanciesAvailable += 1}
        }
    }
}
