//
//  LocalizacaoTableViewCell.swift
//  Desafio
//
//  Created by Rafael Medrado on 30/05/22.
//  Copyright © 2022 Rafael Medrado. All rights reserved.
//

import UIKit

class LocalizacaoTableViewCell: UITableViewCell {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var nomeLocalizacao: UILabel!
    
    // MARK: - Class methods
    
    func configuraCelula(_ local: Localizacao?) {
        nomeLocalizacao.text = local?.name
    }
}
