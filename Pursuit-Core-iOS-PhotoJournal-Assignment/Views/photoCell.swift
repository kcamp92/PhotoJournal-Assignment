//
//  photoCell.swift
//  Pursuit-Core-iOS-PhotoJournal-Assignment
//
//  Created by Krystal Campbell on 10/8/19.
//  Copyright © 2019 Krystal Campbell. All rights reserved.
//

import UIKit

protocol ActionSheetDelegate: AnyObject {
    func actionSheet(tag: Int)
}

class photoCell: UICollectionViewCell {
    
    @IBOutlet weak var photosImageView: UIImageView!

    @IBOutlet weak var DescriptionLabel: UILabel!
    
    @IBOutlet weak var DateLabel: UILabel!
    
    @IBOutlet weak var ActionSheetOutlet: UIButton!
    
    weak var delegate:ActionSheetDelegate?
    
    @IBAction func ActionSheet(_ sender: UIButton) {
        delegate?.actionSheet(tag: sender.tag)
    }
    
}
