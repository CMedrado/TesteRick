//
//  PersonagemViewController.swift
//  Desafio
//
//  Created by Rafael Medrado on 30/05/22.
//  Copyright © 2022 Rafael Medrado. All rights reserved.
//

import UIKit

class PersonagemViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    // MARK: - IBOutlet
    
    @IBOutlet weak var personagensTableView: UITableView!
    
    // MARK: - Actions
    
    @IBAction func botaoVoltar(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    // MARK: - Atributos
    
    private lazy var personagensService = PersonagemHTML()
    private var personagens: [Personagem] = []
    
    // MARK: - View life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configuraTableView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        getPersonagens()
        personagensTableView.reloadData()
    }
    
    // MARK: - Instanciar
    
    class func instanciar() -> PersonagemViewController {
        let personagensViewController = PersonagemViewController(nibName: String(describing: self), bundle: nil)
        
        return personagensViewController
    }
    
    // MARK: - Class methods
    
    func getPersonagens() {
        personagensService.getPersonagens{ [weak self] resposta, error in
            if error == nil {
                guard let personagens = resposta else { return }
                self?.personagens = personagens
                DispatchQueue.main.async {
                    self?.personagensTableView.reloadData()
                }
            }
        }
    }
    
    func configuraTableView() {
        personagensTableView.dataSource = self
        personagensTableView.delegate = self
        personagensTableView.register(UINib(nibName: "PersonagensTableViewCell", bundle: nil), forCellReuseIdentifier: "PersonagensTableViewCell")
    }
    
    func irParaPersonagem(_ personagem: Personagem?){
        if let personagemSelecionado = personagem {
            let detalhePersonagem  = DetalhePersonagemViewController.instanciar(personagemSelecionado)
            navigationController?.pushViewController(detalhePersonagem, animated: true)
        }
    }
    
    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return personagens.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let celulaPersonagem = tableView.dequeueReusableCell(withIdentifier: "PersonagensTableViewCell", for: indexPath) as? PersonagensTableViewCell else {fatalError("error to create cell")}
        
        let personagem = personagens[indexPath.row]
        celulaPersonagem.configuraCelula(personagem)
        
        return celulaPersonagem
    }
    
    // MARK: - UITableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let personagemSelecionado = personagens[indexPath.row]
        irParaPersonagem(personagemSelecionado)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}
