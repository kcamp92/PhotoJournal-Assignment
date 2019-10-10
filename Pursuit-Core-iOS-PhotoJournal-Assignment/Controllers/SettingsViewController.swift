//
//  SettingsViewController.swift
//  Pursuit-Core-iOS-PhotoJournal-Assignment
//
//  Created by Krystal Campbell on 10/8/19.
//  Copyright © 2019 Krystal Campbell. All rights reserved.
//

import UIKit

protocol SwitchDelegate: AnyObject {
    func switchPressed(userSender: UISwitch)
    func segmentedControlPressed(userSender: UISegmentedControl)
}

class SettingsViewController: UIViewController {
    
// MARK: - Properties
    weak var switchDelegate: SwitchDelegate?
    var isON = false
    
// MARK: - IB Outlets
    @IBOutlet weak var switchOutlet: UISwitch!
    @IBOutlet weak var InstructionsLabel: UILabel!
    @IBOutlet weak var segmentedControlOutlet: UISegmentedControl!
    
    
//MARK:- Lifecycle Methods
    
    override func viewDidLoad() {
         super.viewDidLoad()
        InstructionsLabel.text = "Press Switch To Turn Dark Mode On!"
        
     }
     override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        switch isON {
        case true:
            switchOutlet.isOn = true
        case false:
            switchOutlet.isOn = false 
        }
     }
    
    @IBAction func DarkModeSwitch(_ sender: UISwitch) {
        switchDelegate?.switchPressed(userSender: sender)
      dismiss(animated: true)
    }
    
    
    @IBAction func scrollDirectionOrientation(_ sender: UISegmentedControl) {
        switchDelegate?.segmentedControlPressed(userSender: sender)
      //  segmentedControlOutlet.
        
      
        
    }
    
          /*func willRotateToInterfaceOrientation(direction: String) {
              let layout = self.collectionViewOutlet.collectionViewLayout as! UICollectionViewFlowLayout
              if direction == "vertical" {
                  layout.scrollDirection = UICollectionView.ScrollDirection.vertical
              }
              else{
                  layout.scrollDirection = UICollectionView.ScrollDirection.horizontal
              }
          }
          */
    }
    
    

