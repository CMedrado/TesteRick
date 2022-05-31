//
//  DetalhesEpisodiosViewController.swift
//  Desafio
//
//  Created by Rafael Medrado on 26/05/22.
//  Copyright © 2022 Rafael Medrado. All rights reserved.
//

import UIKit

class DetalhesEpisodiosViewController: UIViewController {

    // MARK: - IBOutlets

    @IBOutlet weak var nomeLabel: UILabel!
    @IBOutlet weak var dataLabel: UILabel!
    @IBOutlet weak var episodioLabel: UILabel!
    @IBOutlet weak var charactersLabel: UILabel!
    
    // MARK: - Atributos

    var epi: Episodio?
    
    // MARK: - Instanciar
    
    class func instanciar(_ epi: Episodio) -> DetalhesEpisodiosViewController {
        let detalhesViewController = DetalhesEpisodiosViewController(nibName: String(describing: self), bundle: nil)
        detalhesViewController.epi = epi
        
        return detalhesViewController
    }
    
    // MARK: - View life cycle
   
    override func viewDidLoad() {
        super.viewDidLoad()
        configuraView()
    }
    
    func configuraView() {
        if let episodio = epi{
        nomeLabel.text = episodio.name
        dataLabel.text = episodio.date
        episodioLabel.text = episodio.episode
        let characters = episodio.characters.joined(separator: "\n")
        charactersLabel.text = characters
        }
    }

}
