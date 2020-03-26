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
    
    private func generateRandomNumber() {
        guessNumber = Int.random(in: 0...10)
    }
    
    func startGame()
    {
        generateRandomNumber()
    }
    // Явно такого быть не должно
    func restartGame(triesLabel: UILabel)
    {
        tryCount = 0
        generateRandomNumber()
        setText(triesLabel: triesLabel)
    }
    
    func setText(triesLabel: UILabel)
    {
        triesLabel.text = "Tries: \(tryCount)"
    }
    
    func checkInputNumber(inputNumber: Int, alert: UIAlertController, triesLabel: UILabel) {
        if inputNumber == guessNumber {
            alert.title = "YEAH!"
            alert.message = "You Win!"
            tryCount += 1
            setText(triesLabel: triesLabel)
            restartGame(triesLabel: triesLabel)
        } else {
            if inputNumber > guessNumber {
                alert.title =  ":("
                alert.message = "This number is so big"
                tryCount += 1
                setText(triesLabel: triesLabel)
                
            } else {
                alert.title = ":("
                alert.message = "This number is so small"
                tryCount += 1
                setText(triesLabel: triesLabel)
            }
        }
        alert.addAction(UIAlertAction(title: "Ok", style: .default))
    }
}
