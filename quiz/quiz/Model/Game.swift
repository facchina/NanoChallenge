//
//  Categoria.swift
//  quiz
//
//  Created by LUCAS MONTEIRO PELINZON on 09/03/2018.
//  Copyright © 2018 MARIANA FACCHINA. All rights reserved.
//

class Game {
    let respostaCorreta : String
    var alternativas = Array<String>()
    var dicas = Array<String>()
    
    init(_ respostaCorreta: String, _ alternativas: Array<String>, _ dicas: Array<String>) {
        self.respostaCorreta = respostaCorreta
        self.alternativas = alternativas
        self.dicas = dicas
    }
    
    

}
