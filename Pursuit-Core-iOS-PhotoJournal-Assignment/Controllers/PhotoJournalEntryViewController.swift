//
//  ViewController.swift
//  Pursuit-Core-iOS-PhotoJournal-Assignment
//
//  Created by Krystal Campbell on 10/8/19.
//  Copyright © 2019 Krystal Campbell. All rights reserved.
//

import UIKit

class PhotoJournalEntryViewController: UIViewController, UICollectionViewDataSource{
    
    var photoDeets = [Photos]() {
        didSet {
            self.PhotosCollectionView.reloadData()
        }
    }
    private func loadData(){
        do {
            try self.photoDeets = PhotosPersistenceManager.manager.getPhotos()
        } catch {
            print(error)
        }
    }

     func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photoDeets.count

    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "photoCell", for: indexPath) as! photoCell
        let photoDetails = photoDeets[indexPath.row]
        cell.DescriptionLabel.text = photoDetails.title
        cell.DateLabel.text = photoDetails.creationDate
        cell.photosImageView.image = UIImage(data: photoDetails.image)
        cell.delegate = self
        return cell 
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        PhotosCollectionView.dataSource = self
        PhotosCollectionView.delegate = self
        
        loadData()
    }
    
    @IBOutlet weak var PhotosCollectionView: UICollectionView!
    
    @IBAction func addButton(_ sender: UIBarButtonItem) {
        let storyBoard = UIStoryboard.init(name: "Main", bundle: nil)
        let AddPhotoVC = storyBoard.instantiateViewController(identifier: "AddPhotoJournalEntryVC") as! AddPhotoJournalEntryVC
        present(AddPhotoVC, animated: true, completion: nil)
        AddPhotoVC.modalPresentationStyle = .currentContext
    }
    
}

extension PhotoJournalEntryViewController: ActionSheets {
    //to create an action sheet, you need uialertcontrollers
    func actionSheet(tag: Int) {
        let actionSheet = UIAlertController(title: "Options", message: "Choose an Option", preferredStyle: .actionSheet)
        let delete = UIAlertAction(title: "Delete", style: .destructive) { (action) in
         // let UIAlertAction
            let photoSelected = self.photoDeets[tag]
            self.photoDeets.remove(at: tag)
            try? PhotosPersistenceManager.manager.deletePhotos(withID: photoSelected.creationDate)
        }
        let edit = UIAlertAction(title: "Edit", style: .default) { (action) in
            let AddPhotoVC = self.storyboard?.instantiateViewController(identifier: "AddPhotoJournalEntryVC") as! AddPhotoJournalEntryVC
            AddPhotoVC.makeEdits = .edit
            AddPhotoVC.tag = tag
            AddPhotoVC.photoArray = self.photoDeets
           
            
            AddPhotoVC.modalPresentationStyle = .currentContext
            self.present(AddPhotoVC, animated: true, completion: nil)
            
            //let editPhoto = self.photoDeets[tag]
           // try? PhotosPersistenceManager.manager.//Write code to edit
            
            /*let photoSelected = self.photoDeets[tag]
            self.photoDeets.remove(at: tag)
            try? PhotosPersistenceManager.manager.deletePhotos(withID: photoSelected.creationDate)
             
              let storyBoard = UIStoryboard.init(name: "Main", bundle: nil)
                     let AddPhotoVC = storyBoard.instantiateViewController(identifier: "AddPhotoJournalEntryVC") as! AddPhotoJournalEntryVC
                     present(AddPhotoVC, animated: true, completion: nil)
                     AddPhotoVC.modalPresentationStyle = .currentContext
                 }
                 
             }
             */
        }
        let share = UIAlertAction(title: "Share", style: .default) { (action) in
            let image = UIImage(data: self.photoDeets[tag].image)
            let share = UIActivityViewController(activityItems: [image!], applicationActivities: [])
            self.present(share, animated: true, completion: nil)
        }
        let cancel = UIAlertAction(title: "Cancel", style: .cancel)
         // dismiss(animated: true, completion: nil)
        
        actionSheet.addAction(edit)
        actionSheet.addAction(share)
        actionSheet.addAction(delete)
        actionSheet.addAction(cancel)
        
        self.present(actionSheet, animated: true, completion: nil)
    }
}


extension PhotoJournalEntryViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize.init(width: 350, height: 350)
    }
}

