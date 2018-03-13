//
//  GameViewController.swift
//  quiz
//
//  Created by MARIANA FACCHINA on 12/03/2018.
//  Copyright © 2018 MARIANA FACCHINA. All rights reserved.
//
import UIKit

class GameViewController : UIViewController{
    
    var games : Array<Game> = [Game("Portal", ["Portal", "Q.U.B.E", "The Talos Principle", "Fez", "Transistor"],  ["Puzzle", "Futuristic", "First-Person", "Cake"]),
                               Game("Dark Souls", ["Dark Souls", "Skyrim", "Bloodborne", "Assasin's Creed", "God of War"], ["RPG", "Medieval", "Hard", "Bonfire"]),
                               Game("PUBG", ["PUBG", "Fortnite", "Grand Theft Auto", "Left 4 Dead", "DayZ"], ["Open-World", "Loot", "Battle Royale", "Pan"]),
                               Game("Life is strange", ["Life is Strange","Prince of Persia", "The Walking Dead", "Beyond Two Souls", "Chrono Trigger"], ["Time", "Choices Matter", "Episodic", "Photography"]),
                               Game("Persona", ["Persona", "Rocket League", "Bravely Default", "Final Fantasy XV", "Tokyo Mirage Sessions"], ["Turn Based", "JRPG", "Daily life", "Phantom Thieves"]),
                               Game("Bioshock", ["Bioshock", "Gears of War", "Fallout", "SystemShock", "Deus ex"], ["FPS", "Immersive Sim", "Utopia", "Underwater"]),
                               Game("Zelda: Breath of the Wild", ["Zelda: Breath of the Wild", "PUBG", "Horizon: Zero Dawn", "Shadow of the Colossus", "Worms"], ["Open-World", "Horse", "Hero", "Rupee"])]
    
    let qtdAlternativas = 5
    let qtdDicas = 4
    let qtdGames = 7
    var count : Float = 1.0
    var dicaAtual = 0
    var levelAtual = 0
    
    @IBOutlet weak var alternativa1 : UIButton!
    @IBOutlet weak var alternativa2 : UIButton!
    @IBOutlet weak var alternativa3 : UIButton!
    @IBOutlet weak var alternativa4 : UIButton!
    @IBOutlet weak var alternativa5 : UIButton!
    @IBOutlet var dica : UILabel!
    @IBOutlet weak var progressView: UIProgressView!
    
    var timer = Timer()
    var jogoAtual : Game!
    
    override func viewDidLoad() {
        
        print("Load Datas")
        
        super.viewDidLoad()
        timer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(Start), userInfo: nil, repeats: true)
        view.setGradientBackground(colorOne: UIColor(red: 58.0/255.0, green: 68.0/255.0, blue: 103.0/255.0, alpha: 1.0), colorTwo: UIColor(red: 41.0/255.0, green: 49.0/255.0, blue: 76.0/255.0, alpha: 1.0))
  
        let jogosAleatorios = EmbaralharJogos()
        jogoAtual = jogosAleatorios[levelAtual]
        var alternativasAleatorias = EmbaralharAlternativas(levelAtual: levelAtual, jogos_aleatorios: jogosAleatorios)
        
        dica.text = jogoAtual.dicas[dicaAtual]
        alternativa1.setTitle(alternativasAleatorias[0], for: .normal)
        alternativa2.setTitle(alternativasAleatorias[1], for: .normal)
        alternativa3.setTitle(alternativasAleatorias[2], for: .normal)
        alternativa4.setTitle(alternativasAleatorias[3], for: .normal)
        alternativa5.setTitle(alternativasAleatorias[4], for: .normal)
        progressView.transform = CGAffineTransform(scaleX: 1, y: 2.5)

    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
    }
    
    func NextTip(){
        dicaAtual += 1
        if dicaAtual < qtdDicas{
            count = 1
            
            dica.text = jogoAtual.dicas[dicaAtual]
        }
    }
    
    @objc func Start(){
        if count >= 0{
            count -= 0.1
            progressView.setProgress(count, animated: false)
        }
        else{
            NextTip()
        }
    }
    
    func EmbaralharAlternativas(levelAtual: Int, jogos_aleatorios: Array<Game>) -> Array<String>{
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
    
    func EmbaralharJogos() -> Array<Game>{
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
    
    
    
}

