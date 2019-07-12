//
//  RefeicaoDao.swift
//  eggplant-brownie
//
//  Created by Andriu Felipe Coelho on 12/07/19.
//  Copyright © 2019 Alura. All rights reserved.
//

import Foundation

class RefeicaoDao {
    
    func salvar(_ listaDeRefeicoes: [Refeicao]) {
        guard let diretorio = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return }
        let caminho = diretorio.appendingPathComponent("refeicao")
        do {
            let data = try NSKeyedArchiver.archivedData(withRootObject: listaDeRefeicoes, requiringSecureCoding: false)
            try data.write(to: caminho)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func recuperar() -> [Refeicao]? {
        guard let diretorio = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        let caminho = diretorio.appendingPathComponent("refeicao")
        
        do {
            let data = try Data(contentsOf: caminho)
            let refeicoes = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as? [Refeicao]
            return refeicoes
        } catch {
            print(error.localizedDescription)
        }
        
        return nil
    }
}
