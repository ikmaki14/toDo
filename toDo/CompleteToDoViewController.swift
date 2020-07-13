//
//  CompleteToDoViewController.swift
//  toDo
//
//  Created by Isabella Maki on 7/13/20.
//  Copyright © 2020 Isabella Maki. All rights reserved.
//

import UIKit

class CompleteToDoViewController: UIViewController {
    
    var previousVC = ToDoTableViewController()
//    var selectedToDo = ToDo() // used until iteration 2
    var selectedToDo : ToDoCD? // added in iteration 2
    
    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = selectedToDo?.name // add the ? in iteration 2
    }
    
    @IBAction func doneTapped(_ sender: Any) { // add inside in iteration 2
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            if let theToDo = selectedToDo {
                context.delete(theToDo)
                navigationController?.popViewController(animated: true)
            }
        }
    }
}
