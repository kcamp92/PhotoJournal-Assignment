//
//  PhotoPersistenceHelper.swift
//  Pursuit-Core-iOS-PhotoJournal-Assignment
//
//  Created by Krystal Campbell on 10/9/19.
//  Copyright © 2019 Krystal Campbell. All rights reserved.
//

import Foundation

struct PhotosPersistenceManager{
    private init (){}
    static let manager = PhotosPersistenceManager()
    
    private let persistenceHelper = PersistenceHelper<Photos>(fileName: "photos.plist")
    
    func savePhoto(photo: Photos) throws {
        try persistenceHelper.save(newElement: photo)
    }
    
    func getPhotos() throws -> [Photos] {
        return try persistenceHelper.getObjects()
    }
    
}
