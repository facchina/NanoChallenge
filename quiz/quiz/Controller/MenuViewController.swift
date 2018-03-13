//
//  MenuController.swift
//  quiz
//
//  Created by MARIANA FACCHINA on 12/03/2018.
//  Copyright © 2018 MARIANA FACCHINA. All rights reserved.
//

import UIKit

class MenuViewController : UIViewController{

    @IBOutlet weak var easyButton: UIButton!
    
    @IBOutlet weak var hardButton: UIButton!
    var dificuldadeInt = 1
    @IBAction func selecionarDificuldade(_ sender: UIButton) {
        if let dificuldade = sender.titleLabel?.text?.uppercased(){
            if dificuldade == "EASY"{
                dificuldadeInt = 1
            }
            else{
                dificuldadeInt = 2
            }
        }
//        let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "GameViewController") as! GameViewController
//        secondViewController.dificuldade = dificuldadeInt
        
        print(dificuldadeInt)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "play"{
            let gvc = segue.destination as! GameViewController
            gvc.dificuldade = dificuldadeInt
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        view.setGradientBackground(colorOne: UIColor(red: 58.0/255.0, green: 68.0/255.0, blue: 103.0/255.0, alpha: 1.0), colorTwo: UIColor(red: 41.0/255.0, green: 49.0/255.0, blue: 76.0/255.0, alpha: 1.0))
        
    }
    
}
