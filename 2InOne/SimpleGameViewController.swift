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
<<<<<<< HEAD
    @IBOutlet weak var triesCount: UILabel!
    
    let game1 = Game1()
=======
>>>>>>> 80e6ab916f3450bc6ac6273f697d6a686e24ce90
    
    init() {
        super.init(nibName: "SimpleGame", bundle: nil)

    }
    required init?(coder: NSCoder) {
        super.init(nibName: "SimpleGame", bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
<<<<<<< HEAD
        self.view.backgroundColor = UIColor(patternImage: UIImage(imageLiteralResourceName: "game1Screen"))
        game1.startGame()
=======
        let backgroundImage = UIImage(named: "game1Screen")
        self.view.backgroundColor = UIColor(patternImage: backgroundImage!)
        
        // Do any additional setup after loading the view.
>>>>>>> 80e6ab916f3450bc6ac6273f697d6a686e24ce90
    }
    
    
    @IBAction func buttonTapped(_ sender: UIButton) {
<<<<<<< HEAD
        guard let usersNumb = Int(usersNumber.text ?? "0") else {
            return
        }
        let alert: UIAlertController!
        alert =  UIAlertController(title: "", message: "", preferredStyle: .alert)
        game1.checkInputNumber(inputNumber: usersNumb, alert: alert, triesLabel: triesCount)
=======
        let alert = UIAlertController(
            title: "", message: "push", preferredStyle: .alert)
        alert.addAction(
            UIAlertAction(title: "Ok", style: .cancel ))
>>>>>>> 80e6ab916f3450bc6ac6273f697d6a686e24ce90
        self.present(alert, animated: true)
    }
    
}
