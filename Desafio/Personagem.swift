//
//  Personagem.swift
//  Desafio
//
//  Created by Rafael Medrado on 19/05/22.
//  Copyright © 2022 Rafael Medrado. All rights reserved.
//

import UIKit

class Personagem: NSObject {
    
    //MARK: Atributos
     var id: Int
     var name: String
     var status: String
     var species: String
     var type: String
     var gender: String
     var originName: String
     var originURL: String
     var locationName: String
     var locationURL: String
     var image: UIImage
     var url: String
     var created: String
     var episodios: [String]
    
    //MARK: Init
    
    init(id: Int, name: String, status: String, species: String, type: String, gender: String, originName: String, originURL: String, locationName: String, locationURL: String, image: UIImage, url: String, created: String, episodios: [String]) {
        self.id = id
        self.name = name
        self.status = status
        self.species = species
        self.type = type
        self.gender = gender
        self.originName = originName
        self.originURL = originURL
        self.locationName = locationName
        self.locationURL = locationURL
        self.image = image
        self.url = url
        self.created = created
        self.episodios = episodios
    }
    
    // MARK: - Class methods

    class func serializa(_ json: [String: Any]) -> Personagem? {
        guard let id = json["id"] as? Int,
         let name = json["name"] as? String,
         let status = json["status"] as? String,
         let species = json["species"] as? String,
         let gender = json["gender"] as? String,
         let url = json["url"] as? String,
         let episodios = json["episode"] as? [String],
         let created = json["created"] as? String
            else { return nil }
        guard let location = json["location"] as? [String: Any] else { return nil }
        let locationName = location["name"] as? String ?? ""
        let locationURL = location["url"] as? String ?? ""
        guard let origin = json["origin"] as? [String: Any] else { return nil }
        let originName = origin["name"] as? String ?? ""
        let originURL = origin["url"] as? String ?? ""
        guard let imagem = json["image"] as? String,
            let image = ImagemDoPersonagem().configuraImagem(imagem) else {return nil}
        guard var type = json["type"] as? String
            else {return nil}
        if type == "" {
            type = "Nao especificado"
        }
        
        return Personagem(id: id, name: name, status: status, species: species, type: type, gender: gender, originName: originName, originURL: originURL, locationName: locationName, locationURL: locationURL, image: image, url: url, created: created, episodios: episodios)
    }
}

