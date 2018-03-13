//
//  ScoreViewController.swift
//  quiz
//
//  Created by MARIANA FACCHINA on 12/03/2018.
//  Copyright © 2018 MARIANA FACCHINA. All rights reserved.
//

import UIKit

class ScoreViewController : UIViewController {
    var score:Double = 0
    
    @IBOutlet weak var scoreLabel: UILabel!
   
    @IBOutlet weak var againButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("score ", score)
        scoreLabel.text = String(score)
    }
    
    @IBAction func playAgain(_ sender: UIButton) {
        
        print("entrou")
        let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "GameViewController") as! GameViewController
        self.navigationController?.pushViewController(secondViewController, animated: true)
        
        
        secondViewController.pontuacao = 0
        
        
    }
}
