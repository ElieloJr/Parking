//
//  Data.swift
//  Parking
//
//  Created by Usr_Prime on 05/09/22.
//

import Foundation

class Data {
    // MARK: Colors of Cars
    static var colorCars = ["Preto",
                            "Branco",
                            "Vermelho",
                            "Prata",
                            "Cinza",
                            "Azul",
                            "Marrom",
                            "Verde",
                            "Outra"
    ]
    
    // MARK: Status of parking
    static var parkingStatus: [VacancyDetails] = [
        VacancyDetails(isEmpty: false,
                       numVacancy: 0,
                       ownerName: "Carlos",
                       model: "Celta",
                       color: "Vermelho",
                       licence: "AAA-0621"),
        
        VacancyDetails(isEmpty: true,
                       numVacancy: 1,
                       ownerName: "",
                       model: "",
                       color: "",
                       licence: ""),
        
        VacancyDetails(isEmpty: true,
                       numVacancy: 2,
                       ownerName: "",
                       model: "",
                       color: "",
                       licence: ""),
        
        VacancyDetails(isEmpty: false,
                       numVacancy: 3,
                       ownerName: "Antonio",
                       model: "Corsa",
                       color: "Verde",
                       licence: "BBB-0621"),
        
        VacancyDetails(isEmpty: true,
                       numVacancy: 4,
                       ownerName: "",
                       model: "",
                       color: "",
                       licence: ""),
        
        VacancyDetails(isEmpty: true,
                       numVacancy: 5,
                       ownerName: "",
                       model: "",
                       color: "",
                       licence: ""),
        
        VacancyDetails(isEmpty: false,
                       numVacancy: 6,
                       ownerName: "Josefa",
                       model: "Corolla",
                       color: "Branco",
                       licence: "CCC-0621"),
        
        VacancyDetails(isEmpty: true,
                       numVacancy: 7,
                       ownerName: "",
                       model: "",
                       color: "",
                       licence: ""),
    ]
}
