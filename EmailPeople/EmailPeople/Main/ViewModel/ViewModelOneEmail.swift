//
//  ViewModelOneEmail.swift
//  EmailPeople
//
//  Created by Jordi Milla on 10/12/2020.
//  Copyright © 2020 Jordi Milla Catalan. All rights reserved.
//

import Foundation
import UIKit
import Moya

class ViewModelOneEmail {
    
    let provider = MoyaProvider<EmailPeopleAPI>()
    
    var id: Int?
// Crear un mecanismo para enlazar lo que seria la vista con el modelo de la vista
    var refreshDataOneEmail = { () -> () in }
    
// Fuente de datos
    var dataOneEmail: EmailPeople = EmailPeople(id: 5, name: "", email: "", gender: "", status: "") {
        didSet {
            refreshDataOneEmail()
        }
    }
// Mapear los datos de la API
    
    func requestEmailById(id: Int) {
        provider.request(.getEmailById(id: id)) { result in
            switch result {
            case .success(let response):
                print("succes")
                let data : EmailPeople = try! response.map(ResponseAPI.self).data
                self.dataOneEmail = data
            case .failure:
                print("Error")
            }
        }
    }
}
