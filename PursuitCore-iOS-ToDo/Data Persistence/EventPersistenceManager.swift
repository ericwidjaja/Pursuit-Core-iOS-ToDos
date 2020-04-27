//  EventPersistenceManager.swift
//  PursuitCore-iOS-ToDo
//  Created by Eric Widjaja on 10/25/19.
//  Copyright © 2019 David Rifkin. All rights reserved.

import Foundation
struct EventPersistenceManager {
    
    static let manager = EventPersistenceManager()
    
    private let persistenceHelper = PersistenceHelper<Event>(fileName: "EventsToDo.plist")
    
    func saveToDoListArray(events: [Event]) throws {
        try persistenceHelper.saveArray(newElement: events)
    }
    
    func delete(at tag: Int) throws {
        var events = try persistenceHelper.getObjects()
        events.remove(at: tag)
        try persistenceHelper.replace(elements: events)
    }
    
    func getSavedTasks() throws -> [Event] {
        return try persistenceHelper.getObjects()
    }
    
    private init() {}
}
