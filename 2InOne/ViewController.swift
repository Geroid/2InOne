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
<<<<<<< HEAD
        self.view.backgroundColor = UIColor(patternImage: UIImage(imageLiteralResourceName: "mainScreen"))
    }
    
    @IBAction func showGame1(_ sender: Any) {
        // work with nib/xib
        navigationController?.pushViewController(simpleGameController, animated: true)
    }
    
    @IBAction func showGame2(_ sender: Any) {
        // work with storyboard
        navigationController?.pushViewController(game2ViewController, animated: true)
    }
=======
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
>>>>>>> 80e6ab916f3450bc6ac6273f697d6a686e24ce90
}


