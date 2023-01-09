//
//  AddViewController.swift
//  TaskApp
//
//  Created by Majkel on 09/01/2023.
//

import UIKit

class AddViewController: UIViewController {

    @IBOutlet weak var textFieldTask: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        guard let text = textFieldTask.text else {
            return
        }
        if text.isEmpty {
            return
        }
        dismiss(animated: true, completion: nil)
    }
    @IBAction func cancelButtonPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
}
