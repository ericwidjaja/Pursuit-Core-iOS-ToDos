//  PersistenceHelper.swift
//  PursuitCore-iOS-ToDo
//  Created by Eric Widjaja on 4/26/20.
//  Copyright © 2020 ericW. All rights reserved.

import Foundation

enum DataPersistenceError: Error {
    case savingError(Error)
    case fileDoesNotExist(String)
    case noData
    case decodingError(Error)
    case deletingError(Error)
}

class PersistenceHelper {
    
    private static var events = [Event]()
    private static let filename = "todos.plist"
    
    // Create - save an item to document's directory
    static func save(event: Event) throws {
        
        //get url path to the file that the Event will be saved to
        let url = FileManager.pathToDocumentsDirectory(with: filename)
        
        // append new event to the events array
        events.append(event)
        
        // events array will be object being converted to Data. Use the Data object and write/save it to Documents directory
        do {
            let data = try PropertyListEncoder().encode(events)
            try data.write(to: url, options: .atomic)
        } catch {
            throw DataPersistenceError.savingError(error)
            
        }
    }
}
