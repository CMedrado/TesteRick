//
//  EpisodiosViewController.swift
//  Desafio
//
//  Created by Rafael Medrado on 30/05/22.
//  Copyright © 2022 Rafael Medrado. All rights reserved.
//

import UIKit

class EpisodiosViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    // MARK: - IBOutlet
    
    @IBOutlet weak var episodioTableView: UITableView!
    
    // MARK: - Atributos
    
    private lazy var episodioService = EpisodioHTML()
    private var epi: [Episodio] = []
    
    // MARK: - View life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configuraTableView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        getEpisodio()
        episodioTableView.reloadData()
    }
    
    // MARK: - Instanciar
    
    class func instanciar() -> EpisodiosViewController {
        let epiViewController = EpisodiosViewController(nibName: String(describing: self), bundle: nil)
        
        return epiViewController
    }
    
    // MARK: - Class methods
    
    func getEpisodio() {
        episodioService.getAllEpisodios{[weak self] resposta, error in
            if error == nil {
                guard let episodio = resposta else { return }
                self?.epi = episodio
                DispatchQueue.main.async {
                    self?.episodioTableView.reloadData()
                }
            }
        }
    }
    
    func configuraTableView() {
        episodioTableView.register(UINib(nibName: "EpisodiosTableViewCell", bundle: nil), forCellReuseIdentifier: "EpisodiosTableViewCell")
    }
    
    func irParaEpisodio(_ epi: Episodio?){
        if let episodioSelecionado = epi {
            let detalheEpisodio  = DetalhesEpisodiosViewController.instanciar(episodioSelecionado)
            navigationController?.pushViewController(detalheEpisodio, animated: true)
        }
    }
    
    // MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return epi.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let celulaepi = tableView.dequeueReusableCell(withIdentifier: "EpisodiosTableViewCell", for: indexPath) as? EpisodiosTableViewCell else {fatalError("error to create cell")}
        
        let episodio = epi[indexPath.row]
        celulaepi.configuraCelula(episodio.name)
        
        return celulaepi
    }
    
    // MARK: - UITableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let episodioSelecionado = epi[indexPath.row]
        irParaEpisodio(episodioSelecionado)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
}
