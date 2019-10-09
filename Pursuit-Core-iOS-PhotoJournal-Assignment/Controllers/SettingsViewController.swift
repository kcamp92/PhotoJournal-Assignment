//
//  SettingsViewController.swift
//  Pursuit-Core-iOS-PhotoJournal-Assignment
//
//  Created by Krystal Campbell on 10/8/19.
//  Copyright © 2019 Krystal Campbell. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var switchOutlet: UISwitch!
    @IBOutlet weak var InstructionsLabel: UILabel!
    
    @IBOutlet weak var segmentedControlOutlet: UISegmentedControl!
    @IBOutlet weak var DarkModeLabel: UILabel!
    
    @IBAction func DarkModeSwitch(_ sender: UISwitch) {
    }
    
    @IBAction func scrollDirectionOrientation(_ sender: UISegmentedControl) {
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        // Do any additional setup after loading the view.
    }
    


}
