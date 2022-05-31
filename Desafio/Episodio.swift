//
//  Episodio.swift
//  Desafio
//
//  Created by Rafael Medrado on 19/05/22.
//  Copyright © 2022 Rafael Medrado. All rights reserved.
//

import UIKit

class Episodio: NSObject {

    //MARK: Atributos
    
    var id: Int
    var name: String
    var date: String
    var episode: String
    var urlEpisode: String
    var created: String
    var characters: [String]
    
    //MARK: Init
    
    init(id: Int, name: String, date: String, episode: String, urlEpisode: String, created: String, characaters: [String] = []) {
        self.id = id
        self.name = name
        self.date = date
        self.episode = episode
        self.urlEpisode = urlEpisode
        self.created = created
        self.characters = characaters
    }
    
    // MARK: - Class methods
    
    class func serializa(_ json: [String: Any]) -> Episodio? {
        guard let id = json["id"] as? Int,
         let name = json["name"] as? String,
         let date = json["air_date"] as? String,
         let episode = json["episode"] as? String,
         let url = json["url"] as? String,
         let characters = json["characters"] as? [String],
         let created = json["created"] as? String
            else { return nil }
        
        return Episodio(id: id, name: name, date: date, episode: episode, urlEpisode: url, created: created, characaters: characters)
    }
    
}
