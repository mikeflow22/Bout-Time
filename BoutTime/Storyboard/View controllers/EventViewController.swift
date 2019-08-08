//
//  ViewController.swift
//  BoutTime
//
//  Created by Michael Flowers on 7/21/19.
//  Copyright © 2019 Michael Flowers. All rights reserved.
//

import UIKit

class EventViewController: UIViewController {
    var eventController = EventController()
    
    var aLabel = ""
    var bLabel = ""
    var labelArray: [UILabel] = []
    
    @IBOutlet weak var firstLabel: UILabel!
    @IBOutlet weak var secondLabel: UILabel!
    @IBOutlet weak var thirdLabel: UILabel!
    @IBOutlet weak var fourthLabel: UILabel!
    @IBOutlet weak var timerLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadLabels()
    }
    //Shake Gesture
    //We need to make the view Controller respond to touch events.
    override func becomeFirstResponder() -> Bool {
        return true
    }
    
    //now the actual shake can be detected
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            correctAnswers()
        }
    }
    
    func loadLabels(){
        labelArray += [ firstLabel, secondLabel, thirdLabel, fourthLabel ]
        for label in labelArray {
            guard let event = eventController.events.randomElement() else { print("Error getting random events"); return }
            label.text = event.question
            eventController.currentArray.append(event)
            eventController.remove(event: event)
            print("This is the event: \(event.question)")
        }
    }
    
    @IBAction func upDownVoteButtonPresses(_ sender: UIButton) {
        if sender.tag == 1 || sender.tag == 2 {
            view.backgroundColor = .blue
            changeFirstAndSecondLabels()
        }
        
        if sender.tag == 3 || sender.tag == 4 {
            view.backgroundColor = .red
            changeSecondAndThridLabels()
        }
        
        if sender.tag == 5 || sender.tag == 6 {
            view.backgroundColor = .orange
            changeThirdAndFourthLabels()
        }
    }
    
    func changeFirstAndSecondLabels(){
        //change this condition to check the year
        bLabel = firstLabel.text!
        aLabel = secondLabel.text!
        firstLabel.text = aLabel
        secondLabel.text = bLabel
        
    }
    
    func changeSecondAndThridLabels(){
        //change this condition to check the year
        bLabel = secondLabel.text!
        aLabel = thirdLabel.text!
        secondLabel.text = aLabel
        thirdLabel.text = bLabel
        
    }
    
    func changeThirdAndFourthLabels(){
        //change this condition to check the year
        bLabel = thirdLabel.text!
        aLabel = fourthLabel.text!
        thirdLabel.text = aLabel
        fourthLabel.text = bLabel
        
    }
    
    
    func correctAnswers(){
//        var labelEvent1: Event?
//        var labelEvent2: Event?
//        var labelEvent3: Event?
//        var labelEvent4: Event?
        var holderYear = 0
        var anotherArray: [Event] = []
        let firstArray = eventController.currentArray.sorted()
        print("FirstArray array: \(firstArray)")
        //filter by event year smallest to largest
        for event in eventController.currentArray {
            if event.year > holderYear {
                holderYear = event.year
                anotherArray.insert(event, at: 0)
                print("The year of the event: \(event.year)")
            } else {
                anotherArray.append(event)
            }
        }
        let answer = anotherArray.sorted(by: < )
        print("The anotherArray array: \(answer)")
        
    }
}
