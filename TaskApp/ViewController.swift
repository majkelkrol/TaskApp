//
//  ViewController.swift
//  TaskApp
//
//  Created by Majkel on 04/01/2023.
//

import UIKit

class ViewController: UIViewController {
    
    let tasks = [
    "Play in CyberPunk 2077",
    "Code new app in Xcode",
    "Buy MacStudio",
    "Read the first book in 2023",
    "Wash yours Tesla S Plaid",
    "Listen some metal music",
    "Go for a run"
    ]
    

    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

