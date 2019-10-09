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
    
    func deletePhotos(withID: String) throws {
        do {
            let photos = try getPhotos()
            let newPhotos = photos.filter {$0.creationDate != withID}
            try persistenceHelper.replace(elements: newPhotos)
        }
    }
    
    func replacePhotoArray(photoReplace: [Photos]) throws {
          do {
              try persistenceHelper.replace(elements: photoReplace)
          }
      }
}
