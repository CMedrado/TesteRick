//
//  NomeEpisodio.swift
//  Desafio
//
//  Created by Medrado on 27/05/22.
//  Copyright © 2022 Rafael Medrado. All rights reserved.
//

import UIKit
import Foundation

struct NomeEpisodio {
    
    func nomeEpisodio(_ url: String) -> String? {
        let nome = url
        let numero = nome.components(separatedBy: "/")
        return numero[5]
    }
    func retornaNomes(_ urls: [String]) -> [String]? {
        var numeros: [String] = []
        for ordemEpisodio in urls {
            if let novoNumero = nomeEpisodio(ordemEpisodio) {
                numeros.append(novoNumero)
            }
        }
        return numeros
    }
    
}
 
