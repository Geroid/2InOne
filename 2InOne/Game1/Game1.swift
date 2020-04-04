//
//  game1.swift
//  2InOne
//
//  Created by Viktor Rezvantsev on 23.03.2020.
//  Copyright © 2020 Viktor Rezvantsev. All rights reserved.
//

import Foundation
import UIKit

class Game1 {
    
    // MARK: Properties
    private var guessNumber = 0
    var tryCount = 0
    var record = GameResult()
    
    // MARK: Private funcs
    private func generateRandomNumber() {
        guessNumber = Int.random(in: 0...5)
    }
    
    private func setText() -> String {
        let text = "Tries: \(tryCount)"
        return text
    }
    
    // MARK: Public funcs
    func startGame() {
        generateRandomNumber()
    }
    
    func restartGame() {
        tryCount = 0
        generateRandomNumber()
    }
    
    func checkInputNumber(inputNumber: Int,
                          alert: UIAlertController,
                          triesLabel: UILabel) -> GameResult? {
        if inputNumber == guessNumber {
            alert.title = "YEAH!"
            alert.message = "You Win!"
            tryCount += 1
            triesLabel.text = setText()
            record.number = guessNumber
            record.tries = tryCount
            alert.addAction(UIAlertAction(title: "Ok", style: .default))
            return record
        } else {
            if inputNumber > guessNumber {
                alert.title =  ":("
                alert.message = "This number is so big"
                tryCount += 1
                triesLabel.text = setText()
            } else {
                alert.title = ":("
                alert.message = "This number is so small"
                tryCount += 1
                triesLabel.text = setText()
            }
        }
        alert.addAction(UIAlertAction(title: "Ok", style: .default))
        return nil
    }
}
