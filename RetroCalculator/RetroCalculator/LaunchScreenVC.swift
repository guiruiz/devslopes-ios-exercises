//
//  LaunchScreenVC.swift
//  RetroCalculator
//
//  Created by Guilherme Ruiz on 16/12/16.
//  Copyright © 2016 Guilherme Ruiz. All rights reserved.
//

import UIKit

class LaunchScreenVC: UIViewController {

    @IBOutlet weak var robotBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        robotBtn.imageView?.contentMode = .scaleAspectFit
    }
}
