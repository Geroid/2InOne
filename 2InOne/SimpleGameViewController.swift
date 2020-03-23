//
//  SimpleGameViewController.swift
//  2InOne
//
//  Created by Viktor Rezvantsev on 19.03.2020.
//  Copyright © 2020 Viktor Rezvantsev. All rights reserved.
//

import UIKit

class SimpleGameViewController: UIViewController {

    
    @IBOutlet weak var test: UILabel!
    @IBOutlet weak var usersNumber: UITextField!
    @IBOutlet weak var triesCount: UILabel!
    
    let game1 = Game1()
    
    init() {
        super.init(nibName: "SimpleGame", bundle: nil)

    }
    required init?(coder: NSCoder) {
        super.init(nibName: "SimpleGame", bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(imageLiteralResourceName: "game1Screen"))
        game1.startGame()
    }
    
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        guard let usersNumb = Int(usersNumber.text ?? "0") else {
            return
        }
        let alert: UIAlertController!
        alert =  UIAlertController(title: "", message: "", preferredStyle: .alert)
        game1.checkInputNumber(inputNumber: usersNumb, alert: alert, triesLabel: triesCount)
        self.present(alert, animated: true)
    }
    
}
