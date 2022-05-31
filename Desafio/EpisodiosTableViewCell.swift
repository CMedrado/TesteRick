//
//  EpisodiosTableViewCell.swift
//  Desafio
//
//  Created by Rafael Medrado on 30/05/22.
//  Copyright © 2022 Rafael Medrado. All rights reserved.
//

import UIKit

class EpisodiosTableViewCell: UITableViewCell {

    // MARK: - IBOutlets
    
    @IBOutlet weak var nomeLabel: UILabel!
    
    // MARK: - Class methods
    
    func configuraCelula(_ epi: String) {
        nomeLabel.text = epi
    }
    
}
