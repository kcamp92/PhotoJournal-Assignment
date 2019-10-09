//
//  ViewController.swift
//  Pursuit-Core-iOS-PhotoJournal-Assignment
//
//  Created by Krystal Campbell on 10/8/19.
//  Copyright © 2019 Krystal Campbell. All rights reserved.
//

import UIKit

class PhotoJournalEntryViewController: UIViewController, UICollectionViewDataSource{
    
    var photosDeets = [Photos]() {
        didSet {
            self.PhotosCollectionView.reloadData()
        }
    }
    private func loadData(){
        do {
            try self.photosDeets = PhotosPersistenceManager.manager.getPhotos()
        } catch {
            print(error)
        }
    }

     func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photosDeets.count

    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "photoCell", for: indexPath) as! photoCell
        let photoDetails = photosDeets[indexPath.row]
        cell.DescriptionLabel.text = photoDetails.title
        cell.DateLabel.text = photoDetails.creationDate
        cell.photosImageView.image = UIImage(data: photoDetails.image)
        return cell 
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        PhotosCollectionView.dataSource = self
        PhotosCollectionView.delegate = self
        loadData()
        //PhotosCollectionView.delegate = self
    }
    
    @IBOutlet weak var PhotosCollectionView: UICollectionView!
    
    @IBAction func addButton(_ sender: UIBarButtonItem) {
        let storyBoard = UIStoryboard.init(name: "Main", bundle: nil)
        let AddPhotoVC = storyBoard.instantiateViewController(identifier: "AddPhotoJournalEntryVC") as! AddPhotoJournalEntryVC
        present(AddPhotoVC, animated: true, completion: nil)
    }
    
}

extension PhotoJournalEntryViewController: ActionSheets {
    //to create an action sheet, you need uialertcontrollers
    func actionSheet(tag: Int) {
        let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let delete = UIAlertAction(title: "Delete", style: .destructive) { (_) in
            //Write code to delete
        }
        let edit = UIAlertAction(title: "Edit", style: .default) { (_) in
            //Write code to edit
        }
        let share = UIAlertAction(title: "Share", style: .default) { (_) in
            // write code to share
        }
        let cancel = UIAlertAction(title: "Cancel", style: .cancel) { (_) in
            // write code to cancel
        }
        actionSheet.addAction(edit)
        actionSheet.addAction(share)
        actionSheet.addAction(delete)
        actionSheet.addAction(cancel)
        
    }

    
}

extension PhotoJournalEntryViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize.init(width: 300, height: 300)
    }
}

