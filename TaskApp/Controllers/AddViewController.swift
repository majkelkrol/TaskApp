//
//  AddViewController.swift
//  TaskApp
//
//  Created by Majkel on 09/01/2023.
//

import UIKit

class AddViewController: UIViewController {

    @IBOutlet weak var textFieldTask: UITextField!
    
    var completion: ((String) -> Void)?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textFieldTask.delegate = self
        textFieldTask.becomeFirstResponder()
    }
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func doneButtonTapped(_ sender: Any) {
        saveTask()
    }
    
    func saveTask() {
        guard let text = textFieldTask.text, !text.isEmpty else {
            return
        }
        textFieldTask.endEditing(true)
        navigationController?.popViewController(animated: true)
        completion?(text)
    }
}

extension AddViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        saveTask()
        return true
    }
}
