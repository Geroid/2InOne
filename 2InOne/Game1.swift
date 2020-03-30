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
    
    private var guessNumber = 0
    var tryCount = 0
    var recordsGame: [Int: Int] = [:]
    
    private func generateRandomNumber() {
        guessNumber = Int.random(in: 0...5)
    }
    
    func startGame() {
        generateRandomNumber()
    }
    
    func restartGame() {
        tryCount = 0
        generateRandomNumber()
        //        setText()
    }
    
    private func setText() -> String {
        let text = "Tries: \(tryCount)"
        return text
    }
    
    func checkInputNumber(inputNumber: Int,
                          alert: UIAlertController,
                          triesLabel: UILabel) -> [Int: Int] {
        if inputNumber == guessNumber {
            alert.title = "YEAH!"
            alert.message = "You Win!"
            tryCount += 1
            triesLabel.text = setText()
            recordsGame.updateValue(tryCount, forKey: guessNumber)
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
        return recordsGame
    }
}
