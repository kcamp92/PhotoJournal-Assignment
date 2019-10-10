//
//  SettingsViewController.swift
//  Pursuit-Core-iOS-PhotoJournal-Assignment
//
//  Created by Krystal Campbell on 10/8/19.
//  Copyright © 2019 Krystal Campbell. All rights reserved.
//

import UIKit

protocol SwitchDelegate: AnyObject {
    func isSwitched(userSender: UISwitch)
}

class SettingsViewController: UIViewController {
    
   var collectionViews: photoCell!
    var isON:Bool!
    
    weak var switchDelegate: SwitchDelegate?
    
    @IBOutlet weak var switchOutlet: UISwitch!
    @IBOutlet weak var InstructionsLabel: UILabel!
    
    @IBOutlet weak var segmentedControlOutlet: UISegmentedControl!
    @IBOutlet weak var DarkModeLabel: UILabel!
    
    @IBAction func DarkModeSwitch(_ sender: UISwitch) {
        switchDelegate?.isSwitched(userSender: sender)
        dismiss(animated: true) {
            sender.isOn = self.isON
        }
        //switch sender.isOn
        
//        switch sender.isOn {
//        case true:
//            DarkModeLabel.text = "We are Not in Dark Mode"
//            //self.view.addSubview(collectionViews)
//
//           self.view.backgroundColor = .white
//            DarkModeLabel.textColor = .black
//        case false:
//            DarkModeLabel.text = "We are Not in Dark Mode"
//           // self.view.addSubview(collectionViews)
//            self.view.backgroundColor = .black
//            DarkModeLabel.textColor = .white
//        }
    }
    
    @IBAction func scrollDirectionOrientation(_ sender: UISegmentedControl) {
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
          
    @IBAction func CancelButton(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
