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
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(GameResults[gameType]!){
            let defaults = UserDefaults.standard
            print(encoded)
            defaults.set(encoded, forKey: "SavedResults")
            defaults.synchronize()
        } else {
            print("Error")
        }

    }
    func results(_ gameType: GameType) -> [GameResult] {
//        guard GameResults[gameType] != nil else {
//            return []
//        }
//        let res = GameResults[gameType]!
        let defaults = UserDefaults.standard
        guard let savedResults = defaults.object(forKey: "SavedResults") as? Data else {
            return []
        }
        print(savedResults)
        let decoder = JSONDecoder()
        if let loadedResult = try? decoder.decode([GameResult].self, from: savedResults){
            print (loadedResult)
            return loadedResult
        }
//        guard let loadedResults = decoder.decode(GameResults[gameType]!, from: savedResults) else {
//            return []
//        }
//        return GameResults[gameType]!
//        return loadedResults
        return []
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
