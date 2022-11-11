//
//  ParkingApiResponse.swift
//  Parking
//
//  Created by Usr_Prime on 09/09/22.
//

import Foundation

struct ParkingApiResponse: Codable {
    let id: String
    let client: ClientApiResponse?
    
    let license: String
    let ownerName: String
    let model: String
    let color: String
    
    let entryDate: String
    let entryTime: String
    let exitDate: String?
    let exitTime: String?
    
    let finished: Bool
    let bill: Double?
    
    public init(id: String,
         client: ClientApiResponse?,
         license: String,
         ownerName: String,
         model: String,
         color: String,
         entryDate: String,
         entryTime: String,
         exitDate: String?,
         exitTime: String?,
         finished: Bool,
         bill: Double?) {
        self.id = id
        self.client = client
        self.license = license
        self.ownerName = ownerName
        self.model = model
        self.color = color
        self.entryDate = entryDate
        self.entryTime = entryTime
        self.exitDate = exitDate
        self.exitTime = exitTime
        self.finished = finished
        self.bill = bill
    }
}
