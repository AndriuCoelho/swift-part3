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
        navigationController?.pushViewController(novoItem, animated: true)
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
        
        print("comi \(refeicao.nome) e fiquei com felicidade: \(refeicao.felicidade)")

        delegate?.adicionar(refeicao)

        navigationController?.popViewController(animated: true)
    }

    // MARK: - UITableViewDataSource

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)

        let row = indexPath.row
        let item = items[row]

        cell.textLabel?.text = item.nome

        return cell
    }

    func add(_ item: Item) {
        items.append(item)
        
        if let table = tableView {
            table.reloadData()
        } else {
            let alert = UIAlertController(title: "Desculpe", message: "não foi possível atualizar a tabela", preferredStyle: .alert)
            let ok = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
            alert.addAction(ok)
            present(alert, animated: true, completion: nil)
        }
    }
}

