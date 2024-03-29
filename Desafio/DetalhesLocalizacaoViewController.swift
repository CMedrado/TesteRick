//
//  DetalhesLocalizacaoViewController.swift
//  Desafio
//
//  Created by Rafael Medrado on 26/05/22.
//  Copyright © 2022 Rafael Medrado. All rights reserved.
//

import UIKit

class DetalhesLocalizacaoViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var nomeLabel: UILabel!
    @IBOutlet weak var tipoLabel: UILabel!
    @IBOutlet weak var dimensaoLabel: UILabel!
    @IBOutlet weak var residenteLabel: UILabel!
    
    // MARK: - Atributos

    var local: Localizacao?
    
    // MARK: - Instanciar
    
    class func instanciar(_ local: Localizacao) -> DetalhesLocalizacaoViewController {
        let detalhesViewController = DetalhesLocalizacaoViewController(nibName: String(describing: self), bundle: nil)
        detalhesViewController.local = local
        
        return detalhesViewController
    }
    
    // MARK: - View life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configuraView()
    }
    
    func configuraView() {
        if let localView = local{
        nomeLabel.text = localView.name
        tipoLabel.text = localView.type
        dimensaoLabel.text = localView.dimension
        let moradores = localView.residents.joined(separator: "\n")
        residenteLabel.text = moradores
        }
    }
}

