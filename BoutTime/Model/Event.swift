//
//  Event.swift
//  BoutTime
//
//  Created by Michael Flowers on 8/5/19.
//  Copyright © 2019 Michael Flowers. All rights reserved.
//

import Foundation

struct Event: Equatable, Comparable {
    static func < (lhs: Event, rhs: Event) -> Bool {
        //tell it what to compare
        return lhs.year < rhs.year
    }
    
    
    var question: String
    var year: Int
    
    static func == (lhs: Event, rhs: Event) -> Bool {
        return lhs.question == rhs.question && lhs.year == rhs.year
    }
}

