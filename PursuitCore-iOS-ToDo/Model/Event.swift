//
//  Event.swift
//  PursuitCore-iOS-ToDo
//
//  Created by Eric Widjaja on 4/24/20.
//  Copyright © 2020 ericW. All rights reserved.
//

import Foundation

struct Event {
    var name: String
    var date: Date
    static func getTestData() -> [Event] {
        let eventNames = ["Review BIQ", "Study File Persistence Manager", "Unit Assessment", "Laundry", "Birthday Cake 🥳", "Google Application", "Pick Up Food @ tante Bing"]
        var events = [Event]()
        for eventName in eventNames {
            let event = Event(name: eventName, date: Date())
            events.append(event)
        }
        return events
    }
}
