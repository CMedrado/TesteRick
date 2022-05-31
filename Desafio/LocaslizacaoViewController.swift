//
//  LocalizacaoViewController.swift
//  Desafio
//
//  Created by Rafael Medrado on 26/05/22.
//  Copyright © 2022 Rafael Medrado. All rights reserved.
//

import UIKit

class LocalizacaoViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    // MARK: - IBOutlet
    
    @IBOutlet weak var localizacaoTableView: UITableView!
    
    // MARK: - Atributos
    
    private lazy var localizacaoService = LocalizacaoHTML()
    private var localizacao: [Localizacao] = []
    
    // MARK: - View life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configuraTableView()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        getLocal()
        localizacaoTableView.reloadData()
    }
    
    // MARK: - Instanciar
    
    class func instanciar() -> LocalizacaoViewController {
        let localizacaoViewController = LocalizacaoViewController(nibName: String(describing: self), bundle: nil)
        
        return localizacaoViewController
    }
    
    // MARK: - Class methods
    
    func getLocal() {
        localizacaoService.getLocal{ [weak self] resposta, error in
            if error == nil {
                guard let local = resposta else { return }
                self?.localizacao = local
                DispatchQueue.main.async {
                    self?.localizacaoTableView.reloadData()
                }
            }
        }
    }
    
    func configuraTableView() {
        localizacaoTableView.dataSource = self
        localizacaoTableView.delegate = self
        localizacaoTableView.register(UINib(nibName: "LocalizacaoTableViewCell", bundle: nil), forCellReuseIdentifier: "LocalizacaoTableViewCell")
    }
    
    func irParaLocal(_ local: Localizacao?){
        if let localSelecionado = local {
            let detalheLocal  = DetalhesLocalizacaoViewController.instanciar(localSelecionado)
            navigationController?.pushViewController(detalheLocal, animated: true)
        }
    }

    // MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return localizacao.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let celulaLocal = tableView.dequeueReusableCell(withIdentifier: "LocalizacaoTableViewCell", for: indexPath) as? LocalizacaoTableViewCell else {fatalError("error to create cell")}
        
        let local = localizacao[indexPath.row]
        celulaLocal.configuraCelula(local)
        
        return celulaLocal
    }

    // MARK: - UITableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let localSelecionado = localizacao[indexPath.row]
        irParaLocal(localSelecionado)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
}
