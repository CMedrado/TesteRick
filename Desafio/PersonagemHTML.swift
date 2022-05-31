//
//  PersonagemHTML.swift
//  Desafio
//
//  Created by Rafael Medrado on 20/05/22.
//  Copyright © 2022 Rafael Medrado. All rights reserved.
//

import Foundation

class PersonagemHTML {
    
    func getPersonagens(completion: @escaping (_ personagens: [Personagem]?,_ error: Error?) -> Void) {
        let url = "https://rickandmortyapi.com/api/character"
        guard let URL = URL(string: url) else {
            completion(nil, nil)
            return
        }
        let request = NSMutableURLRequest(url: URL)
        
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request as URLRequest) {
            (data, response, error) in
            do {
                if let data = data {
                    var personagens: [Personagem] = []
                    if let jsonObject = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
                        let results = jsonObject?["results"] as? [[String: Any]] {
                        for personagensDict in results {
                            if let novoPersonagem = Personagem.serializa(personagensDict) {
                            personagens.append(novoPersonagem)
                            }
                        }
                    }
                    completion(personagens, nil)
                    print(personagens)
                }
                else {
                    completion(nil,nil)
                }
            } catch let error as NSError {
                    completion(nil,error)
            }
        }
        
        task.resume()
    }
    
}
