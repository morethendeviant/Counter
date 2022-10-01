//
//  ViewController.swift
//  Counter
//
//  Created by Aleksandr Velikanov on 29.09.2022.
//

import UIKit

class CounterViewController: UIViewController {
    var counterLeadinText = "Значение счётчика для\n"
    var counterName = ""
    var count: Int = 0
    var counterDelegate: CounterDelegate?
    
    @IBOutlet weak var counterLabelView: UILabel!
   
    @IBOutlet weak var counterNameLabelView: UILabel!
    
    @IBAction func incrementButtonTapped(_ sender: UIButton) {
        UIView.transition(
            with: counterLabelView,
            duration: 0.6,
            options: [.transitionFlipFromLeft, .curveEaseInOut]) {
                self.count += 1
                self.counterLabelView.text = String(self.count)
                self.counterDelegate?.updateCounter()
            }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        counterNameLabelView.text = counterLeadinText + counterName
        counterLabelView.text = String(count)
    }
}

