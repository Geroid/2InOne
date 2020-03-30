//
//  ViewController.swift
//  2InOne
//
//  Created by Viktor Rezvantsev on 18.03.2020.
//  Copyright © 2020 Viktor Rezvantsev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private var guessButton: UIButton!
    @IBOutlet private var secondGuessButton: UIButton!
    @IBOutlet private var results: UIButton!
    
    private let simpleGameController = SimpleGameViewController()
    private let game2ViewController = Game2ViewController.instantiate()
    private let resultViewController = ResultViewController.instantiate2()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Main Menu"
    }
    
    @IBAction func showGame1(_ sender: Any) {
        // work with nib/xib
        navigationController?.pushViewController(simpleGameController, animated: true)
    }
    
    @IBAction func showGame2(_ sender: Any) {
        // work with storyboard
        navigationController?.pushViewController(game2ViewController, animated: true)
    }
    
    @IBAction func showResults(_ sender: UIButton) {
        navigationController?.pushViewController(resultViewController, animated: true)
    }
}

