//
//  AddViewController.swift
//  TaskApp
//
//  Created by Majkel on 09/01/2023.
//

import UIKit

protocol AddViewControllerDelegate {
    func fetchNewTask(text: String)
}

class AddViewController: UIViewController {

    @IBOutlet weak var textFieldTask: UITextField!
    
    var delegate: AddViewControllerDelegate?
    
    
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
        delegate?.fetchNewTask(text: text)
    }
}

extension AddViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        saveTask()
        return true
    }
}
