//
//  LocalizacaoHTML.swift
//  Desafio
//
//  Created by Medrado on 27/05/22.
//  Copyright © 2022 Rafael Medrado. All rights reserved.
//

import Foundation

class LocalizacaoHTML {
    
    func getLocal(completion: @escaping (_ localizacao: [Localizacao]?,_ error: Error?) -> Void) {
        let url = "https://rickandmortyapi.com/api/location"
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
                    var localiza: [Localizacao] = []
                    if let jsonObject = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
                        let results = jsonObject?["results"] as? [[String: Any]] {
                        for localizacaoDict in results {
                            if let novoLocal = Localizacao.serializa(localizacaoDict) {
                            localiza.append(novoLocal)
                            print(localiza)
                            }
                        }
                    }
                    completion(localiza, nil)
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
