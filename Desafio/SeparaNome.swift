//
//  SeparaNome.swift
//  Desafio
//
//  Created by Rafael Medrado on 31/05/22.
//  Copyright © 2022 Rafael Medrado. All rights reserved.
//

import Foundation
import UIKit

struct SeparaNome {
    
    func pegaNumeros(_ url: String) -> String? {
        let nome = url
        let numero = nome.components(separatedBy: "/")
        return numero[5]
    }
    func retornaNumeros(_ urls: [String]) -> [String]? {
        var numeros: [String] = []
        for ordemNumeros in urls {
            if let novoNumero = pegaNumeros(ordemNumeros){
                numeros.append(novoNumero)
            }
        }
        return numeros
    }
}
