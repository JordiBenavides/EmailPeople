//
//  EmailPeopleAPI.swift
//  EmailPeople
//
//  Created by Jordi Milla on 07/12/2020.
//  Copyright © 2020 Jordi Milla Catalan. All rights reserved.
//

import Foundation
import Moya

enum EmailPeopleAPI {
    
    case getEmailPeople
    case getEmailById(id: Int)
    
}

extension EmailPeopleAPI:TargetType,AccessTokenAuthorizable {
     public var baseURL: URL {  return URL(string: "https://gorest.co.in/public-api/")!}
    
    public var path: String {
        switch self {
        case .getEmailPeople:
            return "users"
            
        case .getEmailById(id: let id):
            return "users/\(id)"
            
        }
        
    }
    
    var method: Moya.Method {
        switch self {
        case .getEmailPeople:
            return .get
            
        case .getEmailById(id: _):
            return .get
            
        }
    }
    
    var authorizationType: AuthorizationType {
        switch self {
        case .getEmailPeople:
            return .bearer
            
        case .getEmailById(id: _):
            return .bearer
            
        }
    }
    
    public var task: Task {
        switch self {
        case .getEmailPeople:
            return .requestPlain
            
        case .getEmailById(id: _):
            return .requestPlain
            
        }
    }
    
    public var validationType: ValidationType {
        return .none
        
    }
    
    public var sampleData: Data {
        return "".data(using: String.Encoding.utf8)!
        
    }
    
    public var headers: [String: String]? {
        return nil
        
    }
}

