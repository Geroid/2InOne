//
//  RecordsService.swift
//  2InOne
//
//  Created by Viktor Rezvantsev on 30.03.2020.
//  Copyright © 2020 Viktor Rezvantsev. All rights reserved.
//

import Foundation

enum GameType {
    case game1
    case game2
}

class RecordsService {
    
    // MARK: Properties
    static var shared = RecordsService()
    private var GameResults: [GameType: [GameResult]] = [.game1: [], .game2: []]
    
    private init() {}
    
    // MARK: Public funcs
    func addResult (gameType: GameType, results: GameResult) {
        guard GameResults[gameType] != nil else {
            return
        }
        GameResults[gameType]!.append(results)
//        Не работало...
//        resDict.updateValue(resutls.number, forKey: resutls.tries)
//        let defaults = UserDefaults.standard
//        defaults.set(resDict, forKey: "User Results")
//        defaults.synchronize()
    }
    func results(_ gameType: GameType) -> [GameResult] {
        guard GameResults[gameType] != nil else {
            return []
        }
//        let defaults = UserDefaults.standard
//        guard let savedResults = defaults.object(forKey: "User Results") as? [GameResult] else {
//            var error = GameResult()
//            error.number = -1
//            error.tries = -1
//            return [error]
//        }
        return GameResults[gameType]!
    }
    
    func sortNumberDescendingOrder(_ results: [GameResult]) -> [GameResult]{
        var sortedArray = results
        sortedArray.sort {
            $0.number > $1.number
        }
        return sortedArray
    }
    
    func sortTriesDescendingOrder(_ results: [GameResult]) -> [GameResult]{
        var sortedArray = results
        sortedArray.sort {
            $0.tries > $1.tries
        }
        return sortedArray
    }
}
