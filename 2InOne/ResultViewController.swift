//
//  ResultViewController.swift
//  2InOne
//
//  Created by Viktor Rezvantsev on 27.03.2020.
//  Copyright © 2020 Viktor Rezvantsev. All rights reserved.
//

import UIKit

enum Games {
    static let game1 = Game1()
    static let game2 = Game2ViewController()
}

class ResultViewController: UIViewController, UITableViewDelegate {

    @IBOutlet private var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    static func instantiate2() -> ResultViewController {
        return UIStoryboard(name: "Results", bundle: nil).instantiateViewController(withIdentifier: "ResultViewController") as! ResultViewController
    }
    @IBAction private func gameDidChange(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            view.backgroundColor = .white
        case 1:
            view.backgroundColor = .white
        default:
            view.backgroundColor = .white
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Games.game2.results.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "Number: \(Games.game2.results[0] ?? 0) Tries: \(Games.game1.tryCount)"
        
        return cell
    }
    
    
}
