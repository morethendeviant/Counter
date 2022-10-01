//
//  TableViewController.swift
//  Counter
//
//  Created by Aleksandr Velikanov on 30.09.2022.
//

import UIKit

class TableViewController: UITableViewController, CounterDelegate {
    
    var countersData = CounterModel()
    var counterIndex: Int?
    
    func updateCounter() {
        countersData.updateCounter(at: counterIndex)
    }
    
    func createCounter(name: String) {
        countersData.createCounter(name: name)
    }
    
    @objc func addCounter() {
        let alert = UIAlertController(title: "Добавить счетчик", message: nil, preferredStyle: .alert)
        alert.addTextField { textField in
            textField.placeholder = "Название счетчика"
        }
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            if action.style == .default, let text = alert.textFields!.first!.text, !text.isEmpty {
                self.createCounter(name: text)
                self.tableView.reloadData()
            }
        }))
        alert.addAction(UIAlertAction(title: "Отмена", style: .cancel))
        self.present(alert, animated: true, completion: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.rightBarButtonItem = self.editButtonItem
        self.navigationItem.leftBarButtonItem = .init(barButtonSystemItem: .add, target: self, action: #selector(addCounter))
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countersData.counters.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "counterCell", for: indexPath) as! TableViewCell
        cell.counterNameLabel.text = countersData.counters[indexPath.row].name
        cell.counterCountLabel.text = String(countersData.counters[indexPath.row].count)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            countersData.deleteCounter(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let counterViewController = segue.destination as? CounterViewController {
            if let cell = sender as? TableViewCell, let indexPath = tableView.indexPath(for: cell) {
                counterViewController.counterName = countersData.counters[indexPath.row].name
                counterViewController.count = countersData.counters[indexPath.row].count
                counterIndex = indexPath.row
                counterViewController.counterDelegate = self
            }
        }
    }
}
