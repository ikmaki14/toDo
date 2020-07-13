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
    var selectedToDo = ToDo()
    
    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = selectedToDo.name
    }
    
    @IBAction func doneTapped(_ sender: Any) {
    }
}
