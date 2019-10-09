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
    

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photosDeets.count

    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
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


