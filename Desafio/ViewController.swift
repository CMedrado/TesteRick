//
//  ViewController.swift
//  Desafio
//
//  Created by Rafael Medrado on 19/05/22.
//  Copyright © 2022 Rafael Medrado. All rights reserved.
//

import UIKit

class ViewController: UIViewController{
    
    // MARK: - IBOutlet
    
    @IBOutlet weak var homeTableView: UITableView!

    // MARK: - View life cycle    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configuraTableView()
    }
    
    // MARK: - Class methods
    
    func configuraTableView() {
        homeTableView.delegate = self
        homeTableView.dataSource = self
        homeTableView.register(UINib(nibName: "HomeTableViewCell", bundle: nil), forCellReuseIdentifier: "HomeTableViewCell")
    }
    
    func irParaView(_ tipo: Int?){
        if let tipoDeView = tipo {
            switch tipoDeView {
            case 0:
                let tipoPersonagem  = PersonagemViewController.instanciar()
                navigationController?.pushViewController(tipoPersonagem, animated: true)
            case 1:
                let tipoLugar  = LocalizacaoViewController.instanciar()
                navigationController?.pushViewController(tipoLugar, animated: true)
            case 2:
                let tipoEpisodio  = EpisodiosViewController.instanciar()
                navigationController?.pushViewController(tipoEpisodio, animated: true)
            default:
                let tipoPersonagem  = PersonagemViewController.instanciar()
                navigationController?.pushViewController(tipoPersonagem, animated: true)
            }
        }
    }
    
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let celulaHome = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell") as? HomeTableViewCell else {fatalError("error to create call")}
        celulaHome.delegate = self
        celulaHome.configuraCelula()
        
        return celulaHome
    }
    
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 600
    }
}

extension ViewController: HomeTableViewCellDelegate {
    func didSelectedView(_ id: Int?) {
        irParaView(id)
    }
}

//extension ViewController: UINavigationControllerDelegate {
//    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationController.Operation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
//        switch operation {
//        case .push:
//            <#code#>
//        default:
//            <#code#>
//        }
//    }
//}
