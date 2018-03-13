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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.setGradientBackground(colorOne: UIColor(red: 58.0/255.0, green: 68.0/255.0, blue: 103.0/255.0, alpha: 1.0), colorTwo: UIColor(red: 41.0/255.0, green: 49.0/255.0, blue: 76.0/255.0, alpha: 1.0))
        
    }

    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
        hardButton.setTitleColor(UIColor(red: 0.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 0.5), for: [])
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    
    @IBAction func pressEasy(_ sender: UIButton) {
        hardButton.setTitleColor(UIColor(red: 0.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 0.5), for: [])
        easyButton.setTitleColor(UIColor(red: 0.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 1.0), for: [])
    }
    
    @IBAction func pressHard(_ sender: UIButton) {
        easyButton.setTitleColor(UIColor(red: 0.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 0.5), for: [])
        hardButton.setTitleColor(UIColor(red: 0.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 1.0), for: [])
    }
}
