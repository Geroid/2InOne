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
    
    // MARK: Properties
    var recordItems: [GameResult]?
    let cellReuseIdentifier = "cell"
    
    // MARK: Outlets
    @IBOutlet private var tableView: UITableView!
    @IBOutlet var sortNumberButton: UIButton!
    @IBOutlet var sortTriesButton: UIButton!
    
    // MARK: Override funcs
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        tableView.delegate = self
        tableView.dataSource = self
        recordItems = Games.records.results(.game1)
        tableView.reloadData()
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
            recordItems = Games.records.results(.game1)
        case 1:
            recordItems = Games.records.results(.game2)
        default:
            view.backgroundColor = .white
        }
        tableView.reloadData()
    }
    
    @IBAction func didTouchSortNumber(_ sender: UIButton) {
        recordItems = Games.records.sortNumberDescendingOrder(recordItems ?? [])
        tableView.reloadData()
    }
    
    @IBAction func didTouchSortTries(_ sender: UIButton) {
        recordItems = Games.records.sortTriesDescendingOrder(recordItems ?? [])
        tableView.reloadData()
    }
}

// MARK: UITableViewDataSource
extension RecordsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recordItems?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath)
        
        guard let recs = recordItems else {
            return UITableViewCell()
        }
        let item = "Number: \(recs[indexPath.row].number) Tries: \(recs[indexPath.row].tries)"
        cell.textLabel?.text =  item
        return cell
    }
    
    
}
