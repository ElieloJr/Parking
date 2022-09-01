//
//  VacancyDetails.swift
//  Parking
//
//  Created by Usr_Prime on 30/08/22.
//

import Foundation

public struct VacancyDetails {
    public var isEmpty: Bool
    public var numVacancy: Int
    public var ownerName: String
    public var model: String
    public var color: String
    public var licence: String
    
    public init(isEmpty: Bool, numVacancy: Int, ownerName: String, model: String, color: String, licence: String) {
        self.isEmpty = isEmpty
        self.numVacancy = numVacancy
        self.ownerName = ownerName
        self.model = model
        self.color = color
        self.licence = licence
    }
}
