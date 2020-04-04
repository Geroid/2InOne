//
//  Game2ViewController.swift
//  2InOne
//
//  Created by Viktor Rezvantsev on 19.03.2020.
//  Copyright © 2020 Viktor Rezvantsev. All rights reserved.
//

import UIKit

class Game2ViewController: UIViewController {
    
    // MARK: Outlets
    @IBOutlet private var mainTitle: UILabel!
    @IBOutlet private var usersNumberLabel: UILabel!
    @IBOutlet private var triesLabel: UILabel!
    @IBOutlet private var greaterButton: UIButton!
    @IBOutlet private var lessButton: UIButton!
    @IBOutlet private var rightButton: UIButton!
    
    // MARK: Properties
    private var guessNumber = -1
    private var left = 1
    private var right = 1_000_000
    private var tryNumber = 0
    private var records = RecordsService.shared
    private var gameResults = GameResult()
    
    // MARK: Override funcs
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Guessing Game 2"
        startGame2()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        restartGame2()
    }
    
    // MARK: Private funcs
    private func findTheGuessNumber() {
        guessNumber = (left + right) / 2
        tryNumber += 1
        setText(userNumber: usersNumberLabel, tries: triesLabel)
    }
    
    private func setText(userNumber: UILabel, tries: UILabel) {
        userNumber.text = "Your number is \(guessNumber)?"
        tries.text = "Tries: \(tryNumber)"
    }
    
    // MARK: Public funcs
    func startGame2() {
        findTheGuessNumber()
        setText(userNumber: usersNumberLabel, tries: triesLabel)
    }
    
    func restartGame2() {
        tryNumber = 0
        left = 1
        right = 1_000_000
        guessNumber = (left + right) / 2
        startGame2()
    }
    
    static func instantiate() -> Game2ViewController {
        return UIStoryboard(name: "Game2", bundle: nil)
            .instantiateViewController(withIdentifier: "Game2ViewController") as! Game2ViewController
    }
    
    // MARK: IBAction funcs
    @IBAction private func didTouchGreeter(_ sender: UIButton) {
        left = guessNumber + 1
        findTheGuessNumber()
    }
    
    @IBAction private func didTouchLess(_ sender: UIButton) {
        right = guessNumber - 1
        findTheGuessNumber()
    }
    
    @IBAction private func didTouchRight(_ sender: UIButton) {
        gameResults.number = guessNumber
        gameResults.tries = tryNumber
        let alert = UIAlertController(
            title: "YEAH!",
            message: "Machine is so smart",
            preferredStyle: .alert
        )
        let omgAction = UIAlertAction(title: "OMG", style: .default)
        { action in
            self.records.addResult(gameType: .game2, results: self.gameResults)
        }
        let restartAction = UIAlertAction(title: "Restart",style: .default)
        { action in
            self.records.addResult(gameType: .game2, results: self.gameResults)
            self.restartGame2()
        }
        alert.addAction(omgAction)
        alert.addAction(restartAction)
        self.present(alert, animated: true)
    }
}
