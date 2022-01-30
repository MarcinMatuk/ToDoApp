//
//  SaveData.swift
//  ToDoApp
//
//  Created by Marcin Matuk on 23/01/2022.
//

import Foundation

var tasks: [String] = []

func saveData(tasks: [String]) {
    UserDefaults.standard.set(tasks, forKey: "a")
}

func fetchData() -> [String]? {
    if let todo = UserDefaults.standard.array(forKey: "a") as? [String] {
        return todo
    } else {
        return nil
    }
}
