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
    
    init() {
        super.init(nibName: "SimpleGame", bundle: nil)

    }
    required init?(coder: NSCoder) {
        super.init(nibName: "SimpleGame", bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let backgroundImage = UIImage(named: "game1Screen")
        self.view.backgroundColor = UIColor(patternImage: backgroundImage!)
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        let alert = UIAlertController(
            title: "", message: "push", preferredStyle: .alert)
        alert.addAction(
            UIAlertAction(title: "Ok", style: .cancel ))
        self.present(alert, animated: true)
    }
    
}
