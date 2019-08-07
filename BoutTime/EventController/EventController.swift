//
//  EventController.swift
//  BoutTime
//
//  Created by Michael Flowers on 8/5/19.
//  Copyright © 2019 Michael Flowers. All rights reserved.
//

import Foundation

class EventController {
    var events: [Event] = []
    private var removedEvents: [Event] = []
    var timer: Timer?
    
    //init the array
    init(){
        addEvents()
    }
    
    func addEvents(){
        events += [
                    Event(question: "Question 1", year: 1),
                     Event(question: "Question 2", year: 2),
                      Event(question: "Question 3", year: 3),
                      Event(question: "Question 4", year: 3),
                      Event(question: "Question 5", year: 3),
                      Event(question: "Question 6", year: 3),
                      Event(question: "Question 7", year: 3),
                      Event(question: "Question 8", year: 3),
                      Event(question: "Question 9", year: 3),
                      Event(question: "Question 10", year: 3),
                      Event(question: "Question 11", year: 3),
                      Event(question: "Question 12", year: 3),
                      Event(question: "Question 13", year: 3),
                      Event(question: "Question 14", year: 3),
                      Event(question: "Question 15", year: 3),
                      Event(question: "Question 16", year: 3),
                      Event(question: "Question 17", year: 3),
                      Event(question: "Question 18", year: 3),
                      Event(question: "Question 19", year: 1),
                      Event(question: "Question 20", year: 2),
                      Event(question: "Question 21", year: 3),
                      Event(question: "Question 22", year: 3),
                      Event(question: "Question 23", year: 3),
                      Event(question: "Question 24", year: 3),
                      Event(question: "Question 25", year: 3),
                      Event(question: "Question 26", year: 3),
                      Event(question: "Question 27", year: 3),
                      Event(question: "Question 28", year: 3),
                      Event(question: "Question 29", year: 3),
                      Event(question: "Question 30", year: 3),
                      Event(question: "Question 31", year: 3),
                      Event(question: "Question 32", year: 3),
                      Event(question: "Question 33", year: 3),
                      Event(question: "Question 34", year: 3),
                      Event(question: "Question 35", year: 3),
                      Event(question: "Question 36", year: 3),
        ]
    }

    func remove(event: Event){
        guard let index = events.firstIndex(of: event) else { print("Error removing event function"); return }
        events.remove(at: index)
        //add the removed event to the removedEvents array
        removedEvents.append(event)
    }

}
