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
        // Do any additional setup after loading the view.
//        firstLabel.text = "first label"
//        secondLabel.text = "second label"
//        thirdLabel.text = "Third label"
//        fourthLabel.text = "Fourth Label"
        loadLabels()
    }
    
    func loadLabels(){
        labelArray += [ firstLabel, secondLabel, thirdLabel, fourthLabel ]
            for label in labelArray {
                guard let event = eventController.events.randomElement() else { print("Error getting random events"); return }
                label.text = event.question
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
        if firstLabel.text != nil { //change this condition to check the year
            bLabel = firstLabel.text!
            aLabel = secondLabel.text!
            firstLabel.text = aLabel
            secondLabel.text = bLabel
        }
    }
    
    func changeSecondAndThridLabels(){
        if firstLabel.text != nil { //change this condition to check the year
            bLabel = secondLabel.text!
            aLabel = thirdLabel.text!
            secondLabel.text = aLabel
            thirdLabel.text = bLabel
        }
    }
    
    func changeThirdAndFourthLabels(){
    if firstLabel.text != nil { //change this condition to check the year
    bLabel = thirdLabel.text!
    aLabel = fourthLabel.text!
    thirdLabel.text = aLabel
    fourthLabel.text = bLabel
    }
    }
    
}

