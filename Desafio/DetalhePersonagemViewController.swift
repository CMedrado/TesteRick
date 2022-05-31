//
//  DetalhePersonagemViewController.swift
//  Desafio
//
//  Created by Rafael Medrado on 23/05/22.
//  Copyright © 2022 Rafael Medrado. All rights reserved.
//

import UIKit

class DetalhePersonagemViewController: UIViewController {

    // MARK: - IBOutlets
    
    @IBOutlet weak var personagemImage: UIImageView!
    @IBOutlet weak var nomeLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var especieLabel: UILabel!
    @IBOutlet weak var tipoLabel: UILabel!
    @IBOutlet weak var generoLabel: UILabel!
    @IBOutlet weak var originLabel: UILabel!
    @IBOutlet weak var localizacaoLabel: UILabel!
    @IBOutlet weak var episodiosLabel: UILabel!

    
    // MARK: - Atributos
    
    var personagem: Personagem?
    private lazy var episodioService = EpisodioHTML()
    private var epi: Episodio?
    
    // MARK: - Instanciar
    
    class func instanciar(_ personagem: Personagem) -> DetalhePersonagemViewController {
        let detalhesViewController = DetalhePersonagemViewController(nibName: String(describing: self), bundle: nil)
        detalhesViewController.personagem = personagem
        
        return detalhesViewController
    }
    
    // MARK: - View life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configuraView()
    }
    
    func configuraView() {
        if let personagemView = personagem{
        personagemImage.image = personagemView.image
        nomeLabel.text = personagemView.name
        tipoLabel.text = "Tipo: \(personagemView.type)"
        especieLabel.text = "Especie: \(personagemView.species)"
        statusLabel.text = "Status: \(personagemView.status)"
        generoLabel.text = "Genero: \(personagemView.gender)"
        originLabel.text = "Origem: \(personagemView.originName)"
        localizacaoLabel.text = "Localizacao: \(personagemView.locationName)"
        let episodios = personagemView.episodios.joined(separator: "\n")
        episodiosLabel.text = episodios
        }
        
    }
    

    // MARK: - Actions
    
    @IBAction func botaoVoltar(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
}

