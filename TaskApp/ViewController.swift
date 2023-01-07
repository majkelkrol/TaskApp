//
//  ViewController.swift
//  TaskApp
//
//  Created by Majkel on 04/01/2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var taskList = [
        Task(id: 1, title: "Play in CyberPunk 2077", status: true),
        Task(id: 2, title: "Code new app in Xcode", status: true),
        Task(id: 3, title: "Buy MacStudio", status: false),
        Task(id: 4, title: "Read the first book in 2023", status: true),
        Task(id: 5, title: "Wash yours Tesla S Plaid", status: false),
        Task(id: 6, title: "Listen some metal music", status: true),
        Task(id: 7, title: "Go for a run", status: true)
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        taskList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = taskList[indexPath.row].title
        return cell
    }
}
