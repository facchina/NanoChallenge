//
//  ViewController.swift
//  quiz
//
//  Created by MARIANA FACCHINA on 09/03/2018.
//  Copyright © 2018 MARIANA FACCHINA. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var progressView: UIProgressView!
    var timer = Timer()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        timer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(go), userInfo: nil, repeats: true)

    }

    @objc func go(){
        progressView.setProgress(progressView.progress - 0.1, animated: false)
    }
}

