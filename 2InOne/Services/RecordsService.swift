//
//  RecordsService.swift
//  2InOne
//
//  Created by Viktor Rezvantsev on 30.03.2020.
//  Copyright © 2020 Viktor Rezvantsev. All rights reserved.
//

import Foundation

enum GameType: String, Codable {
    case game1
    case game2
}

class RecordsService {
    
    typealias GameResults = [GameType:[GameResult]]
    
    // MARK: Properties
    static var shared = RecordsService()
    
    private init() {}
    
    // MARK: Public funcs
    func addResult (gameType: GameType, results: GameResult) {
        var gameResults = allResults()
        if gameResults[gameType] != nil {
            gameResults[gameType]?.append(results)
        } else {
            gameResults[gameType] = [results]
        }
        
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(gameResults){
            let defaults = UserDefaults.standard
            defaults.set(encoded, forKey: "SavedResults")
            defaults.synchronize()
            
            let stringJSON = String(data: encoded, encoding: .utf8)
            print(stringJSON ?? "")
        } else {
            print("Error")
        }
        
    }
    
    func results(_ gameType: GameType) -> [GameResult] {
        let loadedResult = allResults()
        return loadedResult[gameType] ?? []
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
    
    // MARK: Private funcs
    private func allResults() -> GameResults {
        let defaults = UserDefaults.standard
        guard let savedResults = defaults.object(forKey: "SavedResults") as? Data else{
            return GameResults()
        }
        
        let decoder = JSONDecoder()
        guard let loadedResult = try? decoder.decode(GameResults.self, from: savedResults) else {
            return GameResults()
        }
        
        return loadedResult
    }
}
