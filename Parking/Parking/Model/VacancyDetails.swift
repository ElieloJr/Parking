//
//  VacancyDetails.swift
//  Parking
//
//  Created by Usr_Prime on 30/08/22.
//

import Foundation

public struct VacancyDetails {
    public var isEmpty: Bool
    public var licence: String
    
    public init(isEmpty: Bool, licence: String) {
        self.isEmpty = isEmpty
        self.licence = licence
    }
}
