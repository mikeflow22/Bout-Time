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
                      Event(question: "What a Fool Believes - The Doobie Brothers", year: 1980),
                      Event(question: "Physical - Olivia Newton-John", year: 1981),
                      Event(question: "Bette Davis Eyes - Kim Carnes", year: 1982),
                      Event(question: "Always On My Mind - Willie Nelson", year: 1983),
                      Event(question: "Every Breath You Take - The Police", year: 1984),
                      Event(question: "What's Love Got To Do With It - Tina Turner", year: 1985),
                      Event(question: "We Are The World - USA for Africa", year: 1986),
                      Event(question: "That's What Friends Are For - Dionne Warrick & Friends", year: 1987),
                      Event(question: "Somewhere Out There - Linda Ronstadt & James Ingram", year: 1988),
                      Event(question: "Don't Worry, Be Happy - Bobby McFerrin", year: 1989),
                      Event(question: "Wind Beneath My Wings - Bette Mindler", year: 1990),
                      Event(question: "From A Distance - Bette Midler", year: 1991),
                      Event(question: "Unforgettable - Natalie Cole & Nat King Cole", year: 1992),
                      Event(question: "Tears In Heaven - Eric Clapton", year: 1993),
                      Event(question: "A Whole New World - Peabo Bryson & Regina Belle", year: 1994),
                      Event(question: "Streets Of Philadelphia - Bruce Springsteen", year: 1995),
                      Event(question: "Kiss From A Rose - Seal", year: 1996),
                      Event(question: "Change The World - Eric Clapton", year: 1997),
                      Event(question: "Sunny Came Home - Shawn Colvin", year: 1998),
                      Event(question: "My Heart Will Go On - Celine Dion", year: 1999),
                      Event(question: "Smooth - Santana Ft. Rob Thomas", year: 2000),
                      Event(question: "Beautiful Day - U2", year: 2001),
                      Event(question: "Fallin' - Alicia Keys", year: 2002),
                      Event(question: "Don't Know Why - Norah Jones", year: 2003),
                      Event(question: "Dance With My Father - Luther Vandross", year: 2004),
                      Event(question: "Daughters - John Mayer", year: 2005),
                      Event(question: "Sometimes You Can't Make It On Your Own - U2", year: 2006),
                      Event(question: "Not Ready To Make Nice - Dixie Chicks", year: 2007),
                      Event(question: "Rehab - Amy  Winehouse", year: 2008),
                      Event(question: "Viva La Vida - Coldplay", year: 2009),
                      Event(question: "Single Ladies - Beyonce", year: 2010),
                      Event(question: "Need You Now - Lady Antebellum", year: 2011),
                      Event(question: "Rolling In The Deep - Adele", year: 2012),
                      Event(question: "We Are Young - Fun Ft. Janelle Monae", year: 2013),
                      Event(question: "Royals - Lorde", year: 2014),
                      Event(question: "Stay With Me - Sam Smith", year: 2015),
                      Event(question: "Thinking Out Loud - Ed Sheeran", year: 2016),
                      Event(question: "Hello - Adele", year: 2017),
                      Event(question: "That's What I Like - Bruno Mars", year: 2018),
                      Event(question: "This Is America - Childish Gambino", year: 2019),
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
    
    func checkAnswer(){
        let answerArray = currentArray.sorted()
        
    }

}
