//
//  Date+Extensions.swift
//  PursuitCore-iOS-ToDo
//
//  Created by Eric Widjaja on 4/26/20.
//  Copyright © 2020 ericW. All rights reserved.
//

import Foundation

extension Date {
    func formattedDateString() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE, MMM d, yyyy, hh:mm a"
        formatter.timeZone = .current
        return formatter.string(from: self)
    }
}

