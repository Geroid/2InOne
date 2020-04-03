//
//  SimpleGameViewController.swift
//  2InOne
//
//  Created by Viktor Rezvantsev on 19.03.2020.
//  Copyright © 2020 Viktor Rezvantsev. All rights reserved.
//

import UIKit

class SimpleGameViewController: UIViewController {
    
    // MARK: Outlets
    @IBOutlet weak var test: UILabel!
    @IBOutlet weak var usersNumber: UITextField!
    @IBOutlet weak var triesCount: UILabel!
    
    // MARK: Properties
    let game1 = Game1()
    let records = RecordsService.shared
    
    init() {
        super.init(nibName: "SimpleGame", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        super.init(nibName: "SimpleGame", bundle: nil)
    }
    
    // MARK: Override funcs
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Guessing Game 1"
        game1.startGame()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        triesCount.text = "Tries: 0";
        usersNumber.text = "";
        game1.restartGame()
    }
    
    // MARK: IBAction funcs
    @IBAction func buttonTapped(_ sender: UIButton) {
        let alert: UIAlertController!
        alert =  UIAlertController(title: "", message: "", preferredStyle: .alert)
        guard let usersNumb = Int(usersNumber.text ?? "0") else {
            alert.title = "Error"
            alert.message = "Enter the number!"
            alert.addAction(UIAlertAction(title: "Ok", style: .default))
            self.present(alert, animated: true)
            return
        }
        records.addResult(game1.checkInputNumber(inputNumber: usersNumb, alert: alert, triesLabel: triesCount))
        self.present(alert, animated: true)
    }
    
}
