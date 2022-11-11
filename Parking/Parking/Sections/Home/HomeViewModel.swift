//
//  HomeViewModel.swift
//  Parking
//
//  Created by Usr_Prime on 23/08/22.
//

import Foundation

protocol HomeViewDelegate: AnyObject {
    func reloadData()
    func alertError(with message: String)
}

class HomeViewModel {
    public var parking: [ParkingApiResponse] = []
    public var delegate: HomeViewDelegate?
    public var vacanciesFilled = 0
    public var vacanciesAvailable = 0
    
    public func getVacanciesFilled() -> String { return "\(vacanciesFilled)" }
    public func getVacanciesAvailable() -> String { "\(vacanciesAvailable)" }
    
    public func filterVacancies() {
        vacanciesFilled = 0
        vacanciesAvailable = 0
        
        if parking.count <= 20 {
            var quantVacanciesEmpty = 20 - parking.count
            while quantVacanciesEmpty > 0 {
                parking.append(Data.parkingEmptyResponse)
                quantVacanciesEmpty -= 1
            }
            for park in parking {
                if !park.license.isEmpty { vacanciesFilled += 1 }
                else { vacanciesAvailable += 1}
            }
        }
    }
    
    public func getCars() {
        ParkingAPI.shared.getParking { result in
            switch result {
            case .success(let cars):
                self.parking.removeAll()
                DispatchQueue.main.async { self.delegate?.reloadData() }
                self.parking = cars
                DispatchQueue.main.async {
                    self.filterVacancies()
                    self.delegate?.reloadData()
                }
            case .failure(let error):
                self.delegate?.alertError(with: error.localizedDescription)
                print("Fez merda menó --> \(error)")
            }
        }
    }
}
