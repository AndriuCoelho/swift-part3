//
//  NovoItemViewController.swift
//  eggplant-brownie
//
//  Created by Ândriu Coelho on 21/04/19.
//  Copyright © 2019 Alura. All rights reserved.
//

import UIKit

class NovoItemViewController: UIViewController {

    @IBOutlet weak var nomeTextField: UITextField!
    @IBOutlet weak var caloriasTextField: UITextField!

    var delegate: AdicionarItemDelegate?

    init(delegate: AdicionarItemDelegate) {
        super.init(nibName: "NovoItemViewController", bundle: nil)
        self.delegate = delegate
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    @IBAction func botaoAdicionar(_ sender: UIButton) {
        if delegate != nil {
            guard let nome = nomeTextField.text else { return }
            guard let calorias = caloriasTextField.text else { return }

            if let caloriaDoItem = Double(calorias) {
                let item = Item(nome: nome, calorias: caloriaDoItem)
                delegate?.add(item)
                navigationController?.popViewController(animated: true)
            }
        }
    }
}
