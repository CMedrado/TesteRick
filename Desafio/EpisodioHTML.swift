//
//  EpisodioHTML.swift
//  Desafio
//
//  Created by Medrado on 27/05/22.
//  Copyright © 2022 Rafael Medrado. All rights reserved.
//

import Foundation

class EpisodioHTML {
    
    let url = "https://rickandmortyapi.com/api/episode"
    
    func getAllEpisodios(completion: @escaping (_ epi: [Episodio]?,_ error: Error?) -> Void) {
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
                    var epi: [Episodio] = []
                    if let jsonObject = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
                        let results = jsonObject?["results"] as? [[String: Any]] {
                        for episodioDict in results {
                            if let novoEpisodio = Episodio.serializa(episodioDict) {
                                epi.append(novoEpisodio)
                            }
                        }
                    }
                    completion(epi, nil)
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
    
    func getEpisodio(_ episodio: String, completion: @escaping (_ epi: Episodio?,_ error: Error?) -> Void) {
        
        guard let URL = URL(string: url + episodio) else {
            completion(nil, nil)
            return
        }
        
        let request = NSMutableURLRequest(url: URL)
       
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request as URLRequest) {
            (data, response, error) in
            do {
                if let data = data {
                    var epi: Episodio?
                    if let jsonObject = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
                        let result = jsonObject?["results"] as? [String: Any] {
                         if let novoEpisodio = Episodio.serializa(result) {
                            epi = (novoEpisodio)
                        }
                    }
                    completion(epi, nil)
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
    
    func getEpisodios(_ numeros: String, completion: @escaping (_ epi: [Episodio]?,_ error: Error?) -> Void) {
        
        guard let URL = URL(string: url + numeros) else {
            completion(nil, nil)
            return
        }
        let request = NSMutableURLRequest(url: URL)
        
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request as URLRequest) {
            (data, response, error) in
            do {
                if let data = data {
                    var epi: [Episodio] = []
                    if let jsonObject = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
                        let results = jsonObject?["results"] as? [[String: Any]] {
                        for episodioDict in results {
                            if let novoEpisodio = Episodio.serializa(episodioDict) {
                                epi.append(novoEpisodio)
                            }
                        }
                    }
                    completion(epi, nil)
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
