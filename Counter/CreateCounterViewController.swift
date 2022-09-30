//
//  CreateCounter.swift
//  Counter
//
//  Created by Aleksandr Velikanov on 30.09.2022.
//

import UIKit

class CreateCounterViewController: UIViewController {
    
    var counterDelegate: CounterDelegate?

    @IBOutlet weak var counterButton: UIButton!
    @IBOutlet weak var counterNameTextField: UITextField!
        
    @IBAction func createButtonTapped(_ sender: Any) {
        counterDelegate?.createCounter(name: counterNameTextField.text!)
        self.dismiss(animated: true)
    }
    
    @IBAction func cancelButtonTapped(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
    @objc func textFieldDidChange() {
        if let text = counterNameTextField.text {
            counterButton.isEnabled = !text.isEmpty
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        counterButton.isEnabled = false
        counterNameTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
    }
}
