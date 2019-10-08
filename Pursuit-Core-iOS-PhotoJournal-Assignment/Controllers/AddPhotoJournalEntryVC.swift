//
//  AddPhotoJournalEntryVC.swift
//  Pursuit-Core-iOS-PhotoJournal-Assignment
//
//  Created by Krystal Campbell on 10/8/19.
//  Copyright © 2019 Krystal Campbell. All rights reserved.
//

import UIKit

class AddPhotoJournalEntryVC: UIViewController,UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    var imagePicker: UIImagePickerController!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
  // MARK: - IBOutlets
    
    @IBOutlet weak var imageViewOutlet: UIImageView!
    
    // MARK: - IBActions
    
    
    @IBAction func saveButtonPressed(_ sender: UIBarButtonItem) {
    }
    
    @IBAction func cameraButtonPressed(_ sender: UIBarButtonItem) {
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .camera
        
        present(imagePicker, animated: true, completion: nil)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imagePicker.dismiss(animated: true, completion: nil)
        imageViewOutlet.image = info[.originalImage] as? UIImage
        
    }
    
    @IBAction func cancelButtonPressed(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
}
