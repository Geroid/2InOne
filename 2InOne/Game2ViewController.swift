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
    @IBOutlet var usersNumberLabel: UILabel!
    @IBOutlet var triesLabel: UILabel!
    @IBOutlet var greaterButton: UIButton!
    @IBOutlet var lessButton: UIButton!
    @IBOutlet var rightButton: UIButton!
    
    var guessNumber = -1
    var left = 1
    var right = 1_000_000
    var tryNumber = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(imageLiteralResourceName: "game2Screen"))
        startGame2()
    }
    
    func findTheGuessNumber() {
        guessNumber = (left + right) / 2
        tryNumber += 1
        setText(userNumber: usersNumberLabel, tries: triesLabel)
    }
    
    func setText(userNumber: UILabel, tries: UILabel){
        userNumber.text = "Your number is \(guessNumber)"
        tries.text = "Tries: \(tryNumber)"
        
    }
    
    func startGame2(){
        findTheGuessNumber()
        setText(userNumber: usersNumberLabel, tries: triesLabel)
    }
    
    func restartGame2(){
        tryNumber = 0
        left = 1
        right = 1_000_000
        guessNumber = (left + right) / 2
        startGame2()
    }
    
    static func instantiate() -> Game2ViewController {
        return UIStoryboard(name: "Game2", bundle: nil).instantiateViewController(withIdentifier: "Game2ViewController") as! Game2ViewController
    }
    
    @IBAction func onGreaterButtonClick(_ sender: UIButton) {
        left = guessNumber + 1
        findTheGuessNumber()
    }
    
    @IBAction func onLessButtonClick(_ sender: UIButton) {
        right = guessNumber - 1
        findTheGuessNumber()
    }
    
    @IBAction func onRightButtonClick(_ sender: UIButton) {
        let alert = UIAlertController(title: "YEAH!", message: "Machine is so smart", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OMG", style: .default))
        alert.addAction(UIAlertAction(title: "Restart", style: .default, handler: {
            action in self.restartGame2() }))
        self.present(alert, animated: true)
    }
}
