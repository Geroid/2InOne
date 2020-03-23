//
//  Game2ViewController.swift
//  2InOne
//
//  Created by Viktor Rezvantsev on 19.03.2020.
//  Copyright © 2020 Viktor Rezvantsev. All rights reserved.
//

import UIKit

class Game2ViewController: UIViewController {
    
    @IBOutlet var mainTitle: UILabel!
    @IBOutlet var enterNumberLabel: UILabel!
    @IBOutlet var numberTextField: UITextField!
    @IBOutlet var moreButton: UIButton!
    @IBOutlet var lessButton: UIButton!
    @IBOutlet var rightButton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(imageLiteralResourceName: "game2Screen"))
    }
    
    static func instantiate() -> Game2ViewController {
        return UIStoryboard(name: "Game2", bundle: nil).instantiateViewController(withIdentifier: "Game2ViewController") as! Game2ViewController
    }
}
