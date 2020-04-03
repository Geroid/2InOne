//
//  ResultViewController.swift
//  2InOne
//
//  Created by Viktor Rezvantsev on 27.03.2020.
//  Copyright © 2020 Viktor Rezvantsev. All rights reserved.
//

import UIKit

enum Games {
    static let game1 = SimpleGameViewController()
    static let game2 = Game2ViewController()
    static let records = RecordsService.shared
}

class RecordsViewController: UIViewController, UITableViewDelegate {
    
    var recordItems: [GameResult]?
    
    // MARK: Outlets
    @IBOutlet private var tableView: UITableView!
    
    // MARK: Override funcs
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: Public funcs
    static func instantiate2() -> RecordsViewController {
        return UIStoryboard(name: "Records",
                            bundle: nil).instantiateViewController(withIdentifier: "RecordsViewController") as! RecordsViewController
    }
    
    // MARK: IBAction
    @IBAction private func gameDidChange(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            view.backgroundColor = .white
            recordItems = Games.game1.records.results()
            print(recordItems?.first)
        case 1:
            view.backgroundColor = .white
            print(Games.records.results())
        default:
            view.backgroundColor = .white
        }
        tableView.reloadData()
    }
}

// MARK: UITableViewDelegate
extension RecordsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("Test \(Games.game1.records.results().count)")
        return recordItems?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        guard let recs = recordItems else {
            return UITableViewCell()
        }
        //        cell.setValue(recs, forKey: "result")
        let item = "Number: \(recs[indexPath.row].number) Tries: \(recs[indexPath.row].tries)"
        cell.textLabel?.text =  item
        print(item)
        return cell
    }
    
    
}
