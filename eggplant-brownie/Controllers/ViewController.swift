//
//  ViewController.swift
//  eggplant-brownie
//
//  Created by Andriu Felipe Coelho on 23/02/19.
//  Copyright © 2019 Alura. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, AdicionarItemDelegate {

    // MARK: - IBOutlets

    @IBOutlet var nomeTextField: UITextField?
    @IBOutlet weak var felicidadeTextField: UITextField?
    @IBOutlet weak var tableView: UITableView?
    
    // MARK: - Variaveis

    var delegate: RefeicoesTableViewController?

    var items = [
        Item(nome: "Eggplant", calorias: 10),
        Item(nome: "Brownie", calorias: 10),
        Item(nome: "Muffin", calorias: 500),
        Item(nome: "Chocolate chip", calorias: 1000)
    ]

    override func viewDidLoad() {
        let botaoAdicionar = UIBarButtonItem(title: "novo item", style: .plain, target: self, action: #selector(mostrarNovoItem))
        navigationItem.rightBarButtonItem = botaoAdicionar
    }

    @objc func mostrarNovoItem() {
        let novoItem = NovoItemViewController(delegate: self)
        
        if let navigation = navigationController {
            navigation.pushViewController(novoItem, animated: true)
        } else {
            Alerta(controller: self).show("Desculpe")
        }
    }

    // MARK: - IBAction
    
    @IBAction func adicionar(_ sender: Any) {
        
        guard let nomeDaRefeicao = nomeTextField?.text else {
            return
        }
        
        guard let felicidadeDaRefeicao = felicidadeTextField?.text, let felicidade = Int(felicidadeDaRefeicao) else {
            return
        }
        
        let refeicao = Refeicao(nome: nomeDaRefeicao, felicidade: felicidade)

        delegate?.adicionar(refeicao)
        
        if let navigation = navigationController {
            navigation.popViewController(animated: true)
        } else {
            Alerta(controller: self).show("Atencao", "Erro ao voltar para tela anterior. Refeição adicionada")
        }
    }

    // MARK: - UITableViewDataSource

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celula = UITableViewCell(style: .default, reuseIdentifier: nil)

        let linha = indexPath.row
        let item = items[linha]

        celula.textLabel?.text = item.nome

        return celula
    }

    func add(_ item: Item) {
        items.append(item)
        
        if let table = tableView {
            table.reloadData()
        } else {
            Alerta(controller: self).show()
        }
    }
}
