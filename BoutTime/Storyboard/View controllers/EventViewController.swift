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
    var timer: Timer?
    var countDown: TimeInterval = 35
    
    var timeFormatter: DateComponentsFormatter {
       let formatter = DateComponentsFormatter()
        formatter.unitsStyle = .positional
        formatter.zeroFormattingBehavior = .pad
        formatter.allowedUnits = [.minute, .second]
        return formatter
    }
    
    @IBOutlet weak var firstLabel: UILabel!
    @IBOutlet weak var secondLabel: UILabel!
    @IBOutlet weak var thirdLabel: UILabel!
    @IBOutlet weak var fourthLabel: UILabel!
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var nextRoundProperties: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadViewDidLoad()
    }
    
    func loadViewDidLoad(){
        labelArray += [ firstLabel, secondLabel, thirdLabel, fourthLabel ]
        timerLabel.text = timeFormatter.string(from: countDown)
        nextRoundProperties.isHidden = true
        loadLabels()
    }
    
    //Shake Gesture
    //We need to make the view Controller respond to touch events.
    override func becomeFirstResponder() -> Bool {
        return true
    }
    @IBAction func nextRoundButton(_ sender: UIButton) {
        //
        loadLabels()
        
        //is hidden = true
        nextRoundProperties.isHidden = true
    }
    
    //now the actual shake can be detected
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            restartTimer()
            correctAnswers()
        }
    }
    
    func loadLabels(){
        if eventController.round < 6 {
            //TODO: START TIMER
            createTimer()
            
            for label in labelArray {
                guard let event = eventController.events.randomElement() else { print("Error getting random events"); return }
                label.text = event.question
                eventController.currentArray.append(event)
                eventController.remove(event: event)
                print("This is the event: \(event.question)")
            }
        } else {
            print("GAME OVER")
            //TODO: final mock up, make the screen go blue, button to play again //transition to a different viewController
            performSegue(withIdentifier: "ToFinalScore", sender: nil)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ToFinalScore" {
            let destination = segue.destination as! FinalScoreViewController
            destination.eventController = eventController
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
        let answerArray = eventController.currentArray.sorted()
        let labelTextArray = labelArray.compactMap { $0.text }
        if labelTextArray == answerArray.map { $0.question } {
            //show next round button
            nextRoundProperties.isHidden = false
            nextRoundProperties.setImage(UIImage(named: "next_round_success"), for: .normal)
            //add point
            eventController.addPoints()
            //add round
            eventController.addRound()
            //clearCurrentArray
            eventController.clearCurrentArray()
            
//            loadLabels()
            //clear out current array
            //load new questions for the next round
            print("I think it worked. ")
            print("String array: \(labelTextArray)")
            print("firstArray array: \(answerArray)")
        } else {
            print("Error COMPARABLE DID NOT WORK")
            //show next round button
            nextRoundProperties.isHidden = false
            nextRoundProperties.setImage(UIImage(named: "next_round_fail"), for: .normal)
            //add round
            eventController.addRound()
            //clearCurrentArray
            eventController.clearCurrentArray()
//            loadLabels()
        }
    }
}

extension EventViewController {
    
    func createTimer(){
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(startTimer), userInfo: nil, repeats: true)
    }
    
    @objc func startTimer(){
        print("Timer fired")
        countDown -= 1
        timerLabel.text = timeFormatter.string(from: countDown)
        if countDown == 0 {
            restartTimer()
            //ALERT, AND IN THAT ALERT IS WHERE WE CHECK THE ANSWERS AND LOAD THE NEXT ROUND
            timesUpAlert()
           
        }
    }
    
    //Restart timer
    func restartTimer(){
        timer?.invalidate()
        timer = nil
        countDown = 35
        timerLabel.text = timeFormatter.string(from: countDown)
    }
    
    func timesUpAlert(){
       let alert = UIAlertController(title: "Time is up!", message: "You let the time run out.", preferredStyle: .alert)
        let nextRoundAction = UIAlertAction(title: "Next Round", style: .default) { (_) in
            self.correctAnswers()
        }
        
        let quitGame = UIAlertAction(title: "Quit", style: .destructive) { (_) in
            self.eventController.points = 0
            self.eventController.round = 0
            self.loadLabels()
        }
        
        alert.addAction(nextRoundAction)
        alert.addAction(quitGame)
        present(alert, animated: true, completion: nil)
    }
}
