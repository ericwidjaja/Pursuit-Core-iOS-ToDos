//  Event.swift
//  PursuitCore-iOS-ToDo
//  Created by Eric Widjaja on 4/24/20.
//  Copyright © 2020 ericW. All rights reserved.

import Foundation

struct Event: Codable {
    var name: String
    var date: Date
    var isDone: Bool
    
    init(name: String, date: Date, isDone: Bool = false) {
        self.name = name
        self.date = date
        self.isDone = isDone
    }
    
    static func createEvent(name: String, date: Date) -> Event {
        return Event(name: name, date: date)
    }
    
    public func isItDone() -> Bool {
        return isDone
    }
    
    public func returnEventName() -> String {
        return name
    }
}
