//
//  ViewController.swift
//  2InOne
//
//  Created by Viktor Rezvantsev on 18.03.2020.
//  Copyright © 2020 Viktor Rezvantsev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var guessButton: UIButton!
    @IBOutlet var secondGuessButton: UIButton!
    
    let simpleGameController = SimpleGameViewController()
    let game2ViewController = Game2ViewController.instantiate()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let backgroundImage = UIImage(named: "mainScreen")
        self.view.backgroundColor = UIColor(patternImage: backgroundImage!)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func showGame1(_ sender: Any) {
        // work with nib/xib
        navigationController?.pushViewController(simpleGameController, animated: true)
    }
    
    @IBAction func showGame2(_ sender: Any) {
        // work with storyboard
        navigationController?.pushViewController(game2ViewController, animated: true)
    }
}

