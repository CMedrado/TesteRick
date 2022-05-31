//
//  Imagem.swift
//  Desafio
//
//  Created by Rafael Medrado on 25/05/22.
//  Copyright © 2022 Rafael Medrado. All rights reserved.
//

import UIKit
import Foundation

struct ImagemDoPersonagem {
    private let nomeFotoDoPersonagem = "imagem.png"
    
    func configuraImagem(_ urlString: String) -> UIImage?{
        let url = URL(string: urlString)
        if let data = try? Data(contentsOf: url!){
            let image: UIImage = UIImage(data: data)!
            return image
        }
        return nil
    }
    
    func carregarImagem() -> UIImage?{

    let diretorio = FileManager.SearchPathDirectory.documentDirectory
    let userDomainMask = FileManager.SearchPathDomainMask.userDomainMask
    
    let urlDoArquivo = NSSearchPathForDirectoriesInDomains(diretorio, userDomainMask, true)
        
        if let caminho = urlDoArquivo.first{
            let urlDaImagem = URL(fileURLWithPath: caminho).appendingPathComponent(nomeFotoDoPersonagem)
            
            let imagem = UIImage(contentsOfFile: urlDaImagem.path)
            
            return imagem
        }
        return nil
    }
}
