//
//  HomeTableViewCell.swift
//  Desafio
//
//  Created by Rafael Medrado on 26/05/22.
//  Copyright © 2022 Rafael Medrado. All rights reserved.
//

import UIKit

protocol HomeTableViewCellDelegate: AnyObject {
    func didSelectedView(_ view: Int?)
}

class HomeTableViewCell: UITableViewCell {

    // MARK: - IBOutlets
    
    @IBOutlet var fundoViews: [UIView]!
    
    // MARK: - Atributos
    
    weak var delegate: HomeTableViewCellDelegate?
    
    // MARK: - View life cycle
    
    @objc func didSelectView(_ gesture: UIGestureRecognizer) {
        if let selectedView = gesture.view{
            let tipoView = selectedView.tag
            delegate?.didSelectedView(tipoView)
        }
    }
    
    // MARK: - Class methods
    
    func configuraCelula() {
        
        fundoViews.forEach { viewAtual in
            viewAtual.layer.cornerRadius = 10
            viewAtual.layer.masksToBounds = true
            
            viewAtual.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didSelectView(_:))))
        }
    }
    
}
