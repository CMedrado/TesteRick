//
//  Localizacao.swift
//  Desafio
//
//  Created by Rafael Medrado on 19/05/22.
//  Copyright © 2022 Rafael Medrado. All rights reserved.
//

import UIKit

class Localizacao: NSObject {
    
    //MARK: Atributos
    var id: Int
    var name: String
    var type: String
    var dimension: String
    var url: String
    var created: String
    
    //MARK: Init
    
    init(id: Int, name: String, type: String, dimension: String, url: String, created: String) {
        self.id = id
        self.name = name
        self.type = type
        self.dimension = dimension
        self.url = url
        self.created = created
    }
    
    // MARK: - Class methods
    
    class func serializa(_ json: [String: Any]) -> Localizacao? {
        guard let id = json["id"] as? Int,
         let name = json["name"] as? String,
         let type = json["type"] as? String,
         let dimension = json["dimension"] as? String,
         let url = json["url"] as? String,
         let created = json["created"] as? String
            else { return nil }
        
        return Localizacao(id: id, name: name, type: type, dimension: dimension, url: url, created: created)
    }
    
}
