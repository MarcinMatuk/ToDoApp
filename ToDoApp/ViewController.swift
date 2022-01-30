//
//  ViewController.swift
//  ToDoApp
//
//  Created by Marcin Matuk on 23/01/2022.
//
import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, AddTask {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        if tasks.isEmpty {
            komunikatStartowy()
        }
    }

    func komunikatStartowy() {
        let ac = UIAlertController(title: "Brak zadań do zrobienia", message: "Aby dodać zadanie kliknij przycisk u góry ekranu", preferredStyle: .alert)

        ac.addAction(UIAlertAction(title: "OK!", style: .cancel, handler: nil))
        
        present(ac, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "taskCell", for: indexPath) as! TaskCell
        
        cell.taskNameLabel.text = tasks[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {

            let ac = UIAlertController(title: "Zadanie zostanie usunięte", message: "Potwierdź chęć skasowania:", preferredStyle: .alert)

            ac.addAction(UIAlertAction(title: "Potwierdzam", style: .default, handler: {_ in
                tasks.remove(at: indexPath.row)
                tableView.reloadData()
            }))
            ac.addAction(UIAlertAction(title: "Anuluj", style: .cancel, handler: nil))

            present(ac, animated: true)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! AddTaskController
        vc.delegate = self
    }
    
    func addTask(name: String) {
        tasks.append(name)
        tableView.reloadData()
    }
}
