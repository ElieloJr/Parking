//
//  ClientApiResponse.swift
//  Parking
//
//  Created by Usr_Prime on 09/09/22.
//

import Foundation

struct ClientApiResponse: Codable {
    let id: Int
    let clientName: String
    let cnpj: String
    let email: String
    let password: String
}
