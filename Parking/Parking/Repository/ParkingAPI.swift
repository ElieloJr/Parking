//
//  ParkingAPI.swift
//  Parking
//
//  Created by Usr_Prime on 09/09/22.
//

import UIKit

class APIDetails {
    let urlParking = "https://parking-ntn.herokuapp.com/parking"
    let urlClient = "https://parking-ntn.herokuapp.com/client"
    let user = "user"
    let key = "root"
}

class ParkingAPI {
    let api = APIDetails()
    static let shared = ParkingAPI()
    
    func getParking(completion: @escaping (Result<[ParkingApiResponse], Error>) -> Void) {
        guard let url = URL(string: api.urlParking) else { return }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        
        let joined = api.user + ":" + api.key
        let data = joined.data(using: .utf8)
        let encoded = data?.base64EncodedString()
        let Authorization = "Basic \(encoded ?? "")"

        urlRequest.setValue(Authorization, forHTTPHeaderField: "Authorization")
        urlRequest.setValue("*/*", forHTTPHeaderField: "Content-Type")
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let task = URLSession.shared.dataTask(with: urlRequest) { data, _, error in
            guard let data = data, error == nil else { return }
            do {
                let result = try JSONDecoder().decode([ParkingApiResponse].self, from: data)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
}
