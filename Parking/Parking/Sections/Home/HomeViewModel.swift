//
//  HomeViewModel.swift
//  Parking
//
//  Created by Usr_Prime on 23/08/22.
//

import Foundation

class HomeViewModel {
    
    public var parking: [VacancyDetails] = [
        VacancyDetails(isEmpty: false, licence: "AAA-0621"),
        VacancyDetails(isEmpty: true, licence: ""),
        VacancyDetails(isEmpty: true, licence: ""),
        VacancyDetails(isEmpty: false, licence: "BBB-0622"),
        VacancyDetails(isEmpty: true, licence: ""),
        VacancyDetails(isEmpty: true, licence: ""),
        VacancyDetails(isEmpty: true, licence: ""),
        VacancyDetails(isEmpty: false, licence: "CCC-0623"),
        VacancyDetails(isEmpty: true, licence: ""),
        VacancyDetails(isEmpty: true, licence: ""),
        VacancyDetails(isEmpty: true, licence: ""),
        VacancyDetails(isEmpty: true, licence: ""),
    ]
}
