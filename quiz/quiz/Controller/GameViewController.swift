//
//  GameViewController.swift
//  quiz
//
//  Created by MARIANA FACCHINA on 12/03/2018.
//  Copyright © 2018 MARIANA FACCHINA. All rights reserved.
//
import UIKit

class GameViewController : UIViewController{
    
    @IBOutlet weak var alternativa1 : UIButton!
    @IBOutlet weak var alternativa2 : UIButton!
    @IBOutlet weak var alternativa3 : UIButton!
    @IBOutlet weak var alternativa4 : UIButton!
    @IBOutlet weak var alternativa5 : UIButton!
    @IBOutlet var dica : UILabel!
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var numero_dica: UILabel!
    
    var games : Array<Game> = [Game("Portal", ["Portal", "Q.U.B.E", "The Talos Principle", "Fez", "Transistor"],  ["Puzzle", "Futuristic", "First-Person", "Cake"]),
                               Game("Dark Souls", ["Dark Souls", "Skyrim", "Bloodborne", "Assasin's Creed", "God of War"], ["RPG", "Medieval", "Hard", "Bonfire"]),
                               Game("PUBG", ["PUBG", "Fortnite", "Grand Theft Auto", "Left 4 dead", "DayZ"], ["Open-World", "Loot", "Battle Royale", "Pan"]),
                               Game("Life is strange", ["Life is strange","Prince of Persia", "The walking dead", "Beyon Two Souls", "Chrono Trigger"], ["Time", "Choices matter", "Episodic", "Photography"]),
                               Game("Persona", ["Persona", "Rocket League", "Bravely Default", "Final Fantasy XV", "Tokyo Mirage Sessions"], ["Turn Based", "JRPG", "Daily life", "Phantom Thieves"]),
                               Game("Bioshock", ["Bioshock", "Gears of War", "Fallout", "SystemShock", "Deus ex"], ["FPS", "Immersive sim", "Utopia", "Underwater"]),
                               Game("The legend of Zelda: Breath of the wild", ["The legend of Zelda: Breath of the wild", "PUBG", "Horizon: Zero dawn", "Shadow of the Colossus", "Worms"], ["Open-World", "Horse", "Hero", "Rupee"])]
    // CONSTANTES
    let qtdAlternativas = 5
    var qtdDicas = 4
    let qtdGames = 7
    var decremento_tempo: Float = 0.1
    
    // VARIAVEIS DE CONTROLE
    var count:Float = 1.0
    var dicaAtual = 0
    var levelAtual = 0
    var qtdErros = 0
    var pontuacao:Double = 0
    var dificuldade = 1
    
    var timer = Timer()
    var jogosAleatorios = Array<Game>()
    var alternativasAleatorias = Array<String>()
    var jogoAtual:Game!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        if dificuldade == 1{
            qtdDicas = 4
        }else{
            qtdDicas = 2
        }
        numero_dica.text = "\(dicaAtual+1)/\(qtdDicas)"
        timer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(start), userInfo: nil, repeats: true)
        jogosAleatorios = embaralharJogos()
        refresh()
    }

    @IBAction func verificarAcerto(_ sender: UIButton) {
        if let text = sender.titleLabel!.text{
            if text == jogoAtual.respostaCorreta{
                nextLevel()
            }else{
                qtdErros += 1
            }
        }
    }
    func nextLevel (){
        calcularPontuacao()
        levelAtual += 1
        if levelAtual < qtdGames{
            refresh()
        } else{
            gameOver()
        }
    }
    func gameOver(){
        let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "ScoreViewController") as! ScoreViewController
        self.navigationController?.pushViewController(secondViewController, animated: true)
        secondViewController.score = pontuacao
    }
    
   func refresh(){
        qtdErros = 0
        count = 1
        dicaAtual = 0
        // Pega um fase nova
        jogoAtual = jogosAleatorios[levelAtual]
        // Pega alternativas da fase nova
        alternativasAleatorias = embaralharAlternativas(levelAtual: levelAtual, jogos_aleatorios: jogosAleatorios)
    
        // seta os valores no storyboard
        dica.text = jogoAtual.dicas[dicaAtual]
        numero_dica.text = "\(dicaAtual+1)/\(qtdDicas)"
        alternativa1.setTitle(alternativasAleatorias[0], for: .normal)
        alternativa2.setTitle(alternativasAleatorias[1], for: .normal)
        alternativa3.setTitle(alternativasAleatorias[2], for: .normal)
        alternativa4.setTitle(alternativasAleatorias[3], for: .normal)
        alternativa5.setTitle(alternativasAleatorias[4], for: .normal)
    
    }
    
    
    func nextTip(){
        //incrementa a dica
        dicaAtual += 1
        //se ainda tiver mais dicas atualiza o texto
        if dicaAtual < qtdDicas {
            // reseta o timer
            count = 1
            // atualiza o storyboard
            dica.text = jogoAtual.dicas[dicaAtual]
            numero_dica.text = "\(dicaAtual+1)/\(qtdDicas)"
        }else if dificuldade == 2{
            qtdErros += 5
            nextLevel()
        }
        
    }
    
    @objc func start(){
        if levelAtual < qtdGames{
            if count >= 0{
                count = count - decremento_tempo
                progressView.setProgress(count, animated: false)
            } else{
                nextTip()
            }
        }
    }
    
    func embaralharAlternativas(levelAtual: Int, jogos_aleatorios: Array<Game>) -> Array<String>{
        var sorteados = Array<Int>()
        var alternativas_aleatorias = Array<String>()
        
        while sorteados.count < qtdAlternativas {
            let num = Int(arc4random_uniform(UInt32(qtdAlternativas)))
            if !sorteados.contains(num){
                alternativas_aleatorias.append(jogos_aleatorios[levelAtual].alternativas[num])
                sorteados.append(num)
            }
        }
        
        return alternativas_aleatorias
    }
    
    func embaralharJogos() -> Array<Game>{
        var sorteados = Array<Int>()
        var jogos_aleatorios = Array<Game>()
        
        while sorteados.count < qtdGames{
            let num = Int(arc4random_uniform(UInt32(qtdGames)))
            if !sorteados.contains(num){
                jogos_aleatorios.append(games[num])
                sorteados.append(num)
            }
        }
        
        return jogos_aleatorios
    }   
    
    func calcularPontuacao() {
        let pontuacaoMax  = 10 * Double(levelAtual+1)
        let porcentagem = 0.1 * Double (dificuldade)
        // subtrai da pontuacao maxima 20% por cada erro
        let penalidade = pontuacaoMax * porcentagem * Double(qtdErros)
        pontuacao = pontuacaoMax - penalidade

    }
}

