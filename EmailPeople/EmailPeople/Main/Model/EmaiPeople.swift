//
//  EmaiPeople.swift
//  EmailPeople
//
//  Created by Jordi Milla on 07/12/2020.
//  Copyright © 2020 Jordi Milla Catalan. All rights reserved.
//

import Foundation

struct ResponseAPIArray: Codable {
    
    let data:[EmailPeople]
}

struct ResponseAPI: Codable {
    
    let data:EmailPeople
}

struct EmailPeople: Codable {
    
    let id: Int
    let name: String
    let email: String
    let gender: String
    let status: String
}
