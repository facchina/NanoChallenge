//
//  Categoria.swift
//  quiz
//
//  Created by LUCAS MONTEIRO PELINZON on 09/03/2018.
//  Copyright © 2018 MARIANA FACCHINA. All rights reserved.
//

import Foundation

class Categoria {
    let respostaCorreta : String
    var alternativas = Set<String>()
    var dicas = Set<String>()
    
    init(respostaCorreta: String, alternativas: Set<String>, dicas: Set<String>) {
        self.respostaCorreta = respostaCorreta
        self.alternativas = alternativas
        self.dicas = dicas
    }

}
