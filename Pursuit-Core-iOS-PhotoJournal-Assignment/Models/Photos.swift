//
//  Photos.swift
//  Pursuit-Core-iOS-PhotoJournal-Assignment
//
//  Created by Krystal Campbell on 10/8/19.
//  Copyright © 2019 Krystal Campbell. All rights reserved.
//

import Foundation

struct Photos: Codable {
    var image: Data
    var title: String
    let creationDate: String
}


enum AddOrEdit {
    case add
    case edit
}
