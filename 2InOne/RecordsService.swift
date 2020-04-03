//
//  RecordsService.swift
//  2InOne
//
//  Created by Viktor Rezvantsev on 30.03.2020.
//  Copyright © 2020 Viktor Rezvantsev. All rights reserved.
//

import Foundation

struct GameResult {
    var number = 0
    var tries = 0
}

class RecordsService {
    
    // MARK: Properties
    static var shared = RecordsService()
    private var GameResults: [GameResult] = []
//    private var resDict: [Int: Int] = [:]
    
    private init() {}
    
    // MARK: Public funcs
    func addResult (_ resutls: GameResult) {
        GameResults.append(resutls)
//        resDict.updateValue(resutls.number, forKey: resutls.tries)
//        let defaults = UserDefaults.standard
//        defaults.set(resDict, forKey: "User Results")
//        defaults.synchronize()
    }
    func results() -> [GameResult] {
        
//        let defaults = UserDefaults.standard
//        guard let savedResults = defaults.object(forKey: "User Results") as? [GameResult] else {
//            var error = GameResult()
//            error.number = -1
//            error.tries = -1
//            return [error]
//        }
        return GameResults
    }
}
