//
//  ToDoTableViewController.swift
//  toDo
//
//  Created by Isabella Maki on 7/13/20.
//  Copyright © 2020 Isabella Maki. All rights reserved.
//

import UIKit

class ToDoTableViewController: UITableViewController { // add file in iteration 0
    
//    var toDos : [ToDo] = [] // created in iteration 0 & used until iteration 2
    var toDos : [ToDoCD] = []

    override func viewDidLoad() {
        super.viewDidLoad()

//        toDos = createToDos() // created in iteration 0 & used until iteration 2
//        getToDos() // keep for a bit during iteration 2
    }
    
    // add it iteration 2
    override func viewWillAppear(_ animated: Bool) {
        getToDos()
    }

    // added in iteration 0
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDos.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath) // added in iteration 0
        
        let toDo = toDos[indexPath.row] // added in iteration 0
        
        // add the outside if statement in iteration 3
        if let name = toDo.name {
            // added in iteration 0
            if toDo.important {
                cell.textLabel?.text = "❗️" + name // toDo.name in iteration 0
            } else {
                cell.textLabel?.text = toDo.name
            }
        }

        return cell // added in iteration 0
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // this gives us a single ToDo
        let toDo = toDos[indexPath.row]
        
        performSegue(withIdentifier: "moveToComplete", sender: toDo)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // added at first
        if let addVC = segue.destination as? AddToDoViewController {
            addVC.previousVC = self
        }
        
        // added later
        if let completeVC = segue.destination as? CompleteToDoViewController {
            if let toDo = sender as? ToDoCD { // change to cd in iteration 2
                completeVC.selectedToDo = toDo
                completeVC.previousVC = self
            }
        }
    }
    
    /*
    // created in iteration 0 & used until iteration 2
    func createToDos() -> [ToDo] {
        
        let swift = ToDo()
        swift.name = "Learn Swift"
        swift.important = true
        
        let dog = ToDo()
        dog.name = "Walk the Dog"
        // important is set to false by default
        
        return [swift, dog]
    }
     */
    
    // added in iteration 2
    func getToDos() {
        
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            
            if let coreDataToDos = try? context.fetch(ToDoCD.fetchRequest()) as? [ToDoCD] {
                
                if let theToDos = coreDataToDos {
                    toDos = theToDos
                    tableView.reloadData()
                }
            }
        }
    }

}
