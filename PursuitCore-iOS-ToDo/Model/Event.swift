//  Event.swift
//  PursuitCore-iOS-ToDo
//  Created by Eric Widjaja on 4/24/20.
//  Copyright © 2020 ericW. All rights reserved.
//

import Foundation

struct Event: Codable {
    var name: String
    var date: Date
    var isDone: Bool
    
    init(name: String, date: Date, isItDone: Bool = false) {
        self.name = name
        self.date = date
        self.isDone = isItDone
    }
    
    static func getTestData() -> [Event] {
        let eventNames = ["Review BIQ", "Study File Persistence Manager", "Unit Assessment", "Laundry", "Baking Cake 🥳", "Google Application"]
        var events = [Event]()
        for eventName in eventNames {
            let event = Event(name: eventName, date: Date())
            events.append(event)
        }
        return events
    }
}
