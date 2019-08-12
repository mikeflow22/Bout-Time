//
//  EventController.swift
//  BoutTime
//
//  Created by Michael Flowers on 8/5/19.
//  Copyright © 2019 Michael Flowers. All rights reserved.
//

import Foundation

class EventController {
    var round = 0
    var points = 0
    var events: [Event] = []
    var removedEvents: [Event] = []
    var currentArray: [Event] = []
 
    
    //init the array
    init(){
        addEvents()
    }
    
    func addEvents(){
        events += [
                    Event(question: "Question 1", year: 1),
                     Event(question: "Question 2", year: 2),
                      Event(question: "Question 3", year: 3),
                      Event(question: "Question 4", year: 4),
                      Event(question: "Question 5", year: 5),
                      Event(question: "Question 6", year: 6),
                      Event(question: "Question 7", year: 7),
                      Event(question: "Question 8", year: 8),
                      Event(question: "Question 9", year: 9),
                      Event(question: "Question 10", year: 10),
                      Event(question: "Question 11", year: 11),
                      Event(question: "Question 12", year: 12),
                      Event(question: "Question 13", year: 13),
                      Event(question: "Question 14", year: 14),
                      Event(question: "Question 15", year: 15),
                      Event(question: "Question 16", year: 16),
                      Event(question: "Question 17", year: 17),
                      Event(question: "Question 18", year: 18),
                      Event(question: "Question 19", year: 19),
                      Event(question: "Question 20", year: 20),
                      Event(question: "Question 21", year: 21),
                      Event(question: "Question 22", year: 22),
                      Event(question: "Question 23", year: 23),
                      Event(question: "Question 24", year: 24),
                      Event(question: "Question 25", year: 25),
                      Event(question: "Question 26", year: 26),
                      Event(question: "Question 27", year: 27),
                      Event(question: "Question 28", year: 28),
                      Event(question: "Question 29", year: 29),
                      Event(question: "Question 30", year: 30),
                      Event(question: "Question 31", year: 31),
                      Event(question: "Question 32", year: 32),
                      Event(question: "Question 33", year: 33),
                      Event(question: "Question 34", year: 34),
                      Event(question: "Question 35", year: 35),
                      Event(question: "Question 36", year: 36)
        ]
    }

    func remove(event: Event){
        guard let index = events.firstIndex(of: event) else { print("Error removing event function"); return }
        events.remove(at: index)
        //add the removed event to the removedEvents array
        removedEvents.append(event)
    }
    
    //If they get it right or wrong
    //Add Points
    func addPoints(){
        points += 1
    }
    
    //Move to next round
    func addRound(){
        round += 1
    }
    
    func clearCurrentArray(){
        currentArray.removeAll()
    }
    
    

}
