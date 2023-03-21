//
//  HomeViewModel.swift
//  Parking
//
//  Created by Usr_Prime on 23/08/22.
//

import Foundation
import RxSwift
import RxCocoa

protocol HomeViewDelegate: AnyObject {
    func reloadData()
    func alertError(with message: String)
    func callStatusVacancy(with data: ParkingApiResponse)
}

class HomeViewModel {
    public var parking: [ParkingApiResponse] = []
    public var teste = PublishSubject<[ParkingApiResponse]>()
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
//                parking.onNext([Data.parkingEmptyResponse]) // MARK: Var se funciona
                quantVacanciesEmpty -= 1
            }
            for park in parking {
                if !park.license.isEmpty { vacanciesFilled += 1 }
                else { vacanciesAvailable += 1}
            }
        }
    }
    
//    func fetchUsers() {
//        let adressUrl = "https://jsonplaceholder.typicode.com/posts"
//        let url = URL(string: adressUrl)
//        let task = URLSession.shared.dataTask(with: url!) { ( data, response, error ) in
//            guard let data = data else { return }
//
//            do {
//                let responseData = try JSONDecoder().decode([User].self, from: data)
//                let sectionUser = SectionModel(model: "First",
//                                               items: [User(userID: 0,
//                                                            id: 1,
//                                                            title: "CodeLib",
//                                                            body: "Youtube demo")])
//                let secondSection = SectionModel(model: "Second", items: responseData)
//                self.users.on(.next([sectionUser, secondSection]))
//            } catch {
//                print(error)
//            }
//        }
//        task.resume()
//    }
    
    public func getCars() {
        self.teste.on(.next(Data.parkingResponse))
//        ParkingAPI.shared.getParking { [self] result in
//            switch result {
//            case .success(let cars):
//                self.teste.on(.next(cars))
//                print("Eliel testes --> \(teste)")
//            case .failure(let error):
//                self.delegate?.alertError(with: error.localizedDescription)
//                print("Fez merda menó --> \(error)")
//            }
//        }
    }
    
    public func showDetailsOF(indexCar: IndexPath) {
        print("ENTRA--1")
        teste.map({ carDetail in
            self.delegate?.callStatusVacancy(with: carDetail[indexCar.row])
            print("ENTRA--2")
        })
    }
//    public func getCars() {
//        ParkingAPI.shared.getParking { [self] result in
//            switch result {
//            case .success(let cars):
////                self.parking
//                DispatchQueue.main.async { self.delegate?.reloadData() }
//                self.teste.onNext(cars)
//                self.teste.onCompleted()
//                print("Eliel testes --> \(teste)")
//                DispatchQueue.main.async {
////                    self.filterVacancies()
//                    self.delegate?.reloadData()
//                }
//            case .failure(let error):
//                self.delegate?.alertError(with: error.localizedDescription)
//                print("Fez merda menó --> \(error)")
//            }
//        }
//    }
}
