//
//  PersonagensTableViewCell.swift
//  Desafio
//
//  Created by Rafael Medrado on 19/05/22.
//  Copyright © 2022 Rafael Medrado. All rights reserved.
//

import UIKit

class PersonagensTableViewCell: UITableViewCell {
    
    private lazy var episodiosService = EpisodioHTML()
    
    // MARK: - IBOutlests
    
    @IBOutlet weak var backgroundViewCell: UIView!
    @IBOutlet weak var personagemImage: UIImageView!
    @IBOutlet weak var nomePersonagemLabel: UILabel!
    @IBOutlet weak var typePersonagemLabel: UILabel!
    @IBOutlet weak var localizacaoPersonagemLabel: UILabel!
    @IBOutlet weak var episodioPersonagemLabel: UILabel!
    
    // MARK: - Class methods
    
    func configuraCelula(_ personagem: Personagem?) {
        if let personagemCel = personagem {
        personagemImage.image = personagemCel.image
        nomePersonagemLabel.text = personagemCel.name
        typePersonagemLabel.text = "\(personagemCel.status) - \(personagemCel.type)"
        localizacaoPersonagemLabel.text = personagemCel.locationName
        self.episodioPersonagemLabel.text = personagemCel.episodios[0]
        }
    }
    
}
