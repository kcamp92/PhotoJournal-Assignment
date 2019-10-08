//
//  ViewController.swift
//  Pursuit-Core-iOS-PhotoJournal-Assignment
//
//  Created by Krystal Campbell on 10/8/19.
//  Copyright © 2019 Krystal Campbell. All rights reserved.
//

import UIKit

class PhotoJournalEntryViewController: UIViewController /*UICollectionViewDataSource*/{
   
//
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return 1
//
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        return cell
//
//    }


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
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


/* let optionMenu = UIAlertController(title: nil, message: "Choose Option", preferredStyle: .actionSheet)
 
 let addAction = UIAlertAction(title: "Add to favorites", style: .default) { (action) in
 let film = self.films[tag]
 try? FilmsPersistenceManager.manager.saveFilm(film: film)
 
 }
 let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
 optionMenu.addAction(addAction)
 optionMenu.addAction(cancelAction)
 self.present(optionMenu, animated: true, completion: nil)
 
 
 }
 */
