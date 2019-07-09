//
//  RemoveRefeicaoViewController.swift
//  eggplant-brownie
//
//  Created by Ândriu Felipe Coelho on 09/07/19.
//  Copyright © 2019 Alura. All rights reserved.
//

import UIKit

class RemoveRefeicaoViewController {
    
    let controller: UIViewController
    
    init(controller: UIViewController) {
        self.controller = controller
    }
    
    func mostrar(_ refeicao: Refeicao, block: @escaping (UIAlertAction) -> Void) {
        let alerta = UIAlertController(title: refeicao.nome, message: refeicao.detalhes(), preferredStyle: .alert)
        let ok = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alerta.addAction(ok)
        
        let remove = UIAlertAction(title: "Remove", style: .destructive, handler: block)
        alerta.addAction(remove)
        
        controller.present(alerta, animated: true, completion: nil)
    }
}
