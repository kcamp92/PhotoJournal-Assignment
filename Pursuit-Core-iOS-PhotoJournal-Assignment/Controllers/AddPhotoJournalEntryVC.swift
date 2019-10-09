//
//  AddPhotoJournalEntryVC.swift
//  Pursuit-Core-iOS-PhotoJournal-Assignment
//
//  Created by Krystal Campbell on 10/8/19.
//  Copyright © 2019 Krystal Campbell. All rights reserved.
//

import UIKit

class AddPhotoJournalEntryVC: UIViewController,UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    var makeEdits: AddOrEdit!
    var tag = 0
    var photoArray: [Photos]!
    
    var imagePicker: UIImagePickerController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textViewOutlet.delegate = self
        switch makeEdits {
        case .edit:
            imageViewOutlet.image = UIImage(data: photoArray[tag].image)
        default:
            return
        }
    }
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var imageViewOutlet: UIImageView!
    
    @IBOutlet weak var textViewOutlet: UITextView!
    
    // MARK: - IBActions
    
    
    @IBAction func saveButtonPressed(_ sender: UIBarButtonItem) {
        switch makeEdits {
        case .add:
            guard let imageData = imageViewOutlet.image?.jpegData(compressionQuality: 0.5)
                else {
                    return
            }
            guard let title = textViewOutlet.text else {
                return
            }
            let date = Date()
            let formatter = DateFormatter()
            formatter.dateStyle = .long
            formatter.timeStyle = .medium
            let createdDate = formatter.string(from: date)
            
            let photoInfo = Photos(image: imageData, title: title, creationDate: createdDate)
            do { try PhotosPersistenceManager.manager.savePhoto(photo: photoInfo)
                dismiss(animated: true, completion: nil)
                
            }catch{
                print(error)
            }
        case .edit:
            var photoClicked = photoArray[tag]
            photoClicked.title = textViewOutlet.text
            photoClicked.image = (imageViewOutlet.image?.jpegData(compressionQuality: 0.5))!
            photoArray.insert(photoClicked, at: tag)
            
            photoArray.remove(at: tag + 1 )
           try? PhotosPersistenceManager.manager.replacePhotoArray(photoReplace: photoArray)
            dismiss(animated: true, completion: nil)
        default:
            return
            
        }
    }
    
    @IBAction func cameraButtonPressed(_ sender: UIBarButtonItem) {
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .camera
        
        present(imagePicker, animated: true, completion: nil)
        
    }
    
    @IBAction func photoLibraryPressed(_ sender: UIBarButtonItem) {
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        
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
extension AddPhotoJournalEntryVC: UITextViewDelegate {
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        return true
    }
}
