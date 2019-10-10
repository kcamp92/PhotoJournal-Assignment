//
//  ViewController.swift
//  Pursuit-Core-iOS-PhotoJournal-Assignment
//
//  Created by Krystal Campbell on 10/8/19.
//  Copyright © 2019 Krystal Campbell. All rights reserved.
//

import UIKit

class PhotoJournalEntryViewController: UIViewController, UICollectionViewDataSource{
    
    var isON: Bool!
    
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
       // cell.photosImageView.layer.cornerRadius = 150/3
        cell.delegate = self
        return cell 
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadData()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        PhotosCollectionView.dataSource = self
        PhotosCollectionView.delegate = self
    }
    
    @IBOutlet weak var PhotosCollectionView: UICollectionView!
    
    @IBAction func addButton(_ sender: UIBarButtonItem) {
        let storyBoard = UIStoryboard.init(name: "Main", bundle: nil)
        let AddPhotoVC = storyBoard.instantiateViewController(identifier: "AddPhotoJournalEntryVC") as! AddPhotoJournalEntryVC
        present(AddPhotoVC, animated: true, completion: nil)
        AddPhotoVC.modalPresentationStyle = .currentContext
    }
    
    
    @IBAction func settingsButtonPressed(_ sender: UIBarButtonItem) {
        let storyBoard = UIStoryboard.init(name: "Main", bundle: nil)
        let settingsVC = storyBoard.instantiateViewController(identifier: "SettingsViewController") as! SettingsViewController
        settingsVC.switchDelegate = self
        settingsVC.isON = isON
        present(settingsVC, animated: true, completion: nil)
        settingsVC.modalPresentationStyle = .currentContext
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
       // PhotosCollectionView.scroll
        return CGSize.init(width: 350, height: 350)
    }
  
}

extension PhotoJournalEntryViewController: SwitchDelegate {
    func isSwitched(userSender: UISwitch) {
        switch userSender.isOn {
        case true:
            isON = true
            self.PhotosCollectionView.backgroundColor = .white
            print("hello")
        case false:
            isON = false
            self.PhotosCollectionView.backgroundColor = .black
            print("Goodbye")
        }
    }
    
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
