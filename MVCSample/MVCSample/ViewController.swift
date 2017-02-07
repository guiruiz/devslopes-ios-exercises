//
//  ViewController.swift
//  MVCSample
//
//  Created by Guilherme Ruiz on 22/12/16.
//  Copyright © 2016 Guilherme Ruiz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let person = Person(firstName: "Joao", lastName: "Silva")
    @IBOutlet weak var fullNameLabel: UILabel!
    @IBOutlet weak var renameField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        fullNameLabel.text = person.fullName
        
    }

    @IBAction func updateButtonPressed(_ sender: Any) {
        if let txt = renameField.text {
            person.firstName = txt
            fullNameLabel.text = person.fullName
        }
        
    }

}

