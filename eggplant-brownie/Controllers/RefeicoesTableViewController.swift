//
//  RefeicoesTableViewController.swift
//  eggplant-brownie
//
//  Created by Ândriu Coelho on 17/04/19.
//  Copyright © 2019 Alura. All rights reserved.
//

import UIKit

class RefeicoesTableViewController: UITableViewController, AdicionaRefeicoesDelegate {

    var refeicoes: [Refeicao] = []

    func adicionar(_ refeicao: Refeicao) {
        refeicoes.append(refeicao)
        let dao = RefeicaoDao()
        dao.salvar(refeicoes)
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        getRefeicoes()
    }
    
    func getRefeicoes() {
        let dao = RefeicaoDao()
        guard let listaDeRefeicoes = dao.recuperar() else { return }
        refeicoes = listaDeRefeicoes
        tableView.reloadData()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "adicionarRefeicao" {
            let view = segue.destination as! ViewController
            view.delegate = self
        }
    }

    // MARK: - UITableViewDataSource

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return refeicoes.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let linha = indexPath.row

        let refeicao = refeicoes[linha]

        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        cell.textLabel?.text = refeicao.nome
        
        let gesture = UILongPressGestureRecognizer(target: self, action: #selector(mostrarDetalhes))
        cell.addGestureRecognizer(gesture)

        return cell
    }
    
    @objc func mostrarDetalhes(recognizer: UILongPressGestureRecognizer) {
        if recognizer.state == .began {
            guard let cell = recognizer.view as? UITableViewCell else { return }
            guard let indexPath = tableView.indexPath(for: cell) else { return }
            let linha = indexPath.row
            let refeicao = refeicoes[linha]
            RemoveRefeicaoViewController(controller: self).mostrar(refeicao) { (_ ) in
                self.refeicoes.remove(at: linha)
                self.tableView.reloadData()
            }
        }
    }
}
