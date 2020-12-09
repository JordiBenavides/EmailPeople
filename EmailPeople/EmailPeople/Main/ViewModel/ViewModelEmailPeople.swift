//
//  ViewModelEmailPeople.swift
//  EmailPeople
//
//  Created by Jordi Milla on 07/12/2020.
//  Copyright © 2020 Jordi Milla Catalan. All rights reserved.
//

import Foundation
import UIKit
import Moya

let provider = MoyaProvider<EmailPeopleAPI>()

class ViewModelEmailPeople {
    
 // Crear un mecanismo para enlazar lo que seria la vista con el modelo de la vista
    var refreshData = { () -> () in }
    
 // Fuente de datos(Array)
    var dataArray: [EmailPeople] = [] {
        didSet {
            refreshData()
        }
        
    }
    
 // Mapear los datos de la API
    
    func retriveDataEmailPeople() {
        
        provider.request(.getEmailPeople) { result in
            switch result {
            case .success(let response):
                print("success")
                let array: [EmailPeople] = try! response.map(ResponseAPI.self).data
                self.dataArray = array
            case .failure:
                print("Error")
            }
        }
    }
}
