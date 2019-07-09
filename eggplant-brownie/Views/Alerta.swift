//
//  Alerta.swift
//  eggplant-brownie
//
//  Created by Ândriu Felipe Coelho on 09/07/19.
//  Copyright © 2019 Alura. All rights reserved.
//

import UIKit

class Alerta {
    
    let controller: UIViewController
    
    init(controller: UIViewController) {
        self.controller = controller
    }
    
    func show(_ titulo: String = "Desculpe", _ mensagem: String = "Erro desconhecido") {
        let alert = UIAlertController(title: "Desculpe", message: mensagem, preferredStyle: .alert)
        let ok = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alert.addAction(ok)
        controller.present(alert, animated: true, completion: nil)
    }
}
