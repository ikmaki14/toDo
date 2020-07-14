//
//  AddToDoViewController.swift
//  toDo
//
//  Created by Isabella Maki on 7/13/20.
//  Copyright © 2020 Isabella Maki. All rights reserved.
//

import UIKit

class AddToDoViewController: UIViewController { // add file in iteration 1
    
    var previousVC = ToDoTableViewController()

    @IBOutlet weak var titleTextField: UITextField! // add in iteration 1
    @IBOutlet weak var importantSwitch: UISwitch! //
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // may take a moment for the ToDoCD() to work (may have to restart xcode)
    @IBAction func addTapped(_ sender: Any) { // add in iteration 1
        
        // we have to grab this view context to be able to work with Core Data
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            
            let toDo = ToDoCD(entity: ToDoCD.entity(), insertInto: context)
            
            // if the titleTextField has text, we will call that text titleText
            if let titleText = titleTextField.text {
                // we will take the titleText and assign that value to toDo.name
                // this .name and .important came from the attributes you typed in on the Core Data page!
                toDo.name = titleText
                toDo.important = importantSwitch.isOn
            }
            
            try? context.save()
            
            navigationController?.popViewController(animated: true)
        }
            
        /*
        // from iterartion 0 & 1
        let toDo = ToDo()
        
        if let titleText = titleTextField.text {
            toDo.name = titleText
            toDo.important = importantSwitch.isOn
        }
        
        previousVC.toDos.append(toDo)
        previousVC.tableView.reloadData()
        navigationController?.popViewController(animated: true)
        */
    }
}
