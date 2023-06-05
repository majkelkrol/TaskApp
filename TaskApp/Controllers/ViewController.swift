//
//  ViewController.swift
//  TaskApp
//
//  Created by Majkel on 04/01/2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var taskList = ["Play in CyberPunk 2077", "Code new app in Xcode", "Buy MacStudio", "Read the first book in 2023", "Wash yours Tesla S Plaid", "Listen some metal music", "Go for a run"]
    
    let defaults = UserDefaults.standard
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupCell()
        
        if let task = defaults.array(forKey: "TaskList") as? [String] {
            taskList = task
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    @IBAction func editButtonTapped(_ sender: Any) {
        if tableView.isEditing {
            tableView.isEditing = false
        } else {
            tableView.isEditing = true
        }
    }
    
    @IBAction func addButtonPressed(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(identifier: "add") as! AddViewController
        vc.completion = { text in
            self.taskList.append(text)
            self.defaults.set(self.taskList, forKey: "TaskList")
        }
        navigationController?.pushViewController(vc, animated: false)
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func setupCell() {
        tableView.register(UINib(nibName: "TableViewCell", bundle: Bundle.main), forCellReuseIdentifier: TableViewCell.cellId)
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! TableViewCell
        
        if cell.status {
            cell.taskImage.image = UIImage(systemName: "bookmark.circle.fill")
            cell.status.toggle()
        } else {
            cell.taskImage.image = UIImage(systemName: "bookmark.circle")
            cell.status.toggle()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return TableViewCell.height
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        .delete
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tableView.beginUpdates()
            taskList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.endUpdates()
        }
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taskList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.cellId, for: indexPath) as! TableViewCell
        let task = taskList[indexPath.row]
        cell.taskLabel.text = task
        return cell
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        taskList.swapAt(sourceIndexPath.row, destinationIndexPath.row)
    }
}
