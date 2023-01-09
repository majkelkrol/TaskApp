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
        textFieldTask.delegate = self
        textFieldTask.becomeFirstResponder()
    }
    
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        guard let text = textFieldTask.text, !text.isEmpty else {
            return
        }
        print(text)
        textFieldTask.endEditing(true)
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cancelButtonPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
}

extension AddViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textFieldTask.resignFirstResponder()
        return true
    }
}
