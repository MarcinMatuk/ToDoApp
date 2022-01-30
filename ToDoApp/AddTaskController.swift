//
//  AddTaskController.swift
//  ToDoApp
//
//  Created by Marcin Matuk on 23/01/2022.
//

import UIKit

class AddTaskController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    let kategorie = ["praca", "zakupy", "inne"]
    
    var delegate: AddTask?

    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBOutlet weak var pickerView: UIPickerView!
    
    @IBOutlet weak var taskNameOutlet: UITextField!
    
    @IBAction func addAction(_ sender: Any) {
        if taskNameOutlet.text != "" {
            delegate?.addTask(name: taskNameOutlet.text!)
            komunikatDodano()
        } else {
            komunikatBlad()
        }
    }
    
    func komunikatDodano() {
        let ac = UIAlertController(title: "Gratulacje", message: "dodałeś zadanie do listy", preferredStyle: .alert)

        ac.addAction(UIAlertAction(title: "OK", style: .cancel, handler: {_ in
            self.navigationController?.popViewController(animated: true)
        }))
        present(ac, animated: true)
    }
    
    func komunikatBlad() {
        let ac = UIAlertController(title: "Uwaga!", message: "Aby dodać zadanie musisz wprowadzić nazwę", preferredStyle: .alert)

        ac.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        
        present(ac, animated: true)
    }
    
    @IBAction func cancel(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        datePicker.locale = .current
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .compact
        
        pickerView.dataSource = self
        pickerView.delegate = self
    }
    

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return kategorie.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return kategorie[row]
    }
    
    //klawiatura znika
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

protocol AddTask {
    func addTask(name: String)
}
