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
    var countDown: TimeInterval = 60
    
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
        labelArray += [ firstLabel, secondLabel, thirdLabel, fourthLabel ]
        timerLabel.text = timeFormatter.string(from: countDown)
        nextRoundProperties.isHidden = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        restartTimer()
        loadLabels()
    }
    
    //Shake Gesture
    //We need to make the view Controller respond to touch events.
    override func becomeFirstResponder() -> Bool {
        return true
    }
    
    @IBAction func nextRoundButton(_ sender: UIButton) {
        nextRoundProperties.isHidden = true
        loadLabels()
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
//                print("This is the event: \(event.question)")
            }
        } else {
            print("GAME OVER")
            //TODO: final mock up, make the screen go blue, button to play again //transition to a different viewController
            restartTimer()
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
        
        switch sender.tag {
        case 2,4:
            moveEventUp(labelTag: sender.tag)
            sender.setImage(UIImage(named: "up_half_selected"), for: .normal)
        case 6:
            moveEventUp(labelTag: sender.tag)
            sender.setImage(UIImage(named: "up_full_selected"), for: .normal)

        case 3,5:
            moveEventDown(labelTag: sender.tag)
            sender.setImage(UIImage(named: "down_half_selected"), for: .normal)
        case 1:
            moveEventDown(labelTag: sender.tag)
            sender.setImage(UIImage(named: "down_full_selected"), for: .normal)
        default:
            break
        }
        
//        moveEventUp(labelTag: sender.tag)
//        if sender.tag == 1 || sender.tag == 2 {
//            changeFirstAndSecondLabels()
//        }
//
//        if sender.tag == 3 || sender.tag == 4 {
//            changeSecondAndThridLabels()
//        }
//
//        if sender.tag == 5 || sender.tag == 6 {
//            changeThirdAndFourthLabels()
//        }
        
    }
    
    func changeButtonsBack(){
        
    }
    
    func moveEventUp(labelTag: Int){
        if labelTag == 2  || labelTag == 1 {
            //put second label into firstLabel
            bLabel = firstLabel.text!
            aLabel = secondLabel.text!
            firstLabel.text = aLabel
            secondLabel.text = bLabel
        }
        
        if labelTag == 4 || labelTag == 3 {
            //put third label into secondLabel
            bLabel = secondLabel.text!
            aLabel = thirdLabel.text!
            secondLabel.text = aLabel
            thirdLabel.text = bLabel
        }
        
        if labelTag == 6 || labelTag == 5{
            //put fourt label into thridLabel
            bLabel = thirdLabel.text!
            aLabel = fourthLabel.text!
            thirdLabel.text = aLabel
            fourthLabel.text = bLabel
        }
    }
    
    func moveEventDown(labelTag: Int){
        if  labelTag == 1 {
            //put second label into firstLabel
            aLabel = firstLabel.text!
            bLabel = secondLabel.text!
            firstLabel.text = bLabel
            secondLabel.text = aLabel
        }
        
        if labelTag == 3 {
            //put third label into secondLabel
            aLabel = secondLabel.text!
            bLabel = thirdLabel.text!
            secondLabel.text = bLabel
            thirdLabel.text = aLabel
        }
        
        if labelTag == 5 {
            //put fourt label into thridLabel
            aLabel = thirdLabel.text!
            bLabel = fourthLabel.text!
            thirdLabel.text = bLabel
            fourthLabel.text = aLabel
        }
    }
//
//    func changeFirstAndSecondLabels(){
////        //change this condition to check the year
////        bLabel = firstLabel.text!
////        aLabel = secondLabel.text!
////        firstLabel.text = aLabel
////        secondLabel.text = bLabel
//
//    }
//
//    func changeSecondAndThridLabels(){
//        //change this condition to check the year
////        bLabel = secondLabel.text!
////        aLabel = thirdLabel.text!
////        secondLabel.text = aLabel
////        thirdLabel.text = bLabel
//
//    }
//
//    func changeThirdAndFourthLabels(){
//        //change this condition to check the year
////        bLabel = thirdLabel.text!
////        aLabel = fourthLabel.text!
////        thirdLabel.text = aLabel
////        fourthLabel.text = bLabel
//
//    }
    
    func correctAnswers(){
        let labelTextArray = labelArray.compactMap { $0.text }
        eventController.labelStringArray = labelTextArray
        
        //compare arrays
        if eventController.checkAnswer() {
            nextRound()
            nextRoundProperties.setImage(UIImage(named: "next_round_success"), for: .normal)
            
        } else {
            nextRound()
            nextRoundProperties.setImage(UIImage(named: "next_round_fail"), for: .normal)
        }
        
        
//        let answerArray = eventController.currentArray.sorted()
//        let labelTextArray = labelArray.compactMap { $0.text }
//        eventController.labelStringArray = labelTextArray
//
//        if labelTextArray == answerArray.map { $0.question } {
//            //show next round button
//            nextRound()
////            //add point
////            eventController.addPoints()
//            nextRoundProperties.setImage(UIImage(named: "next_round_success"), for: .normal)
//            //load new questions for the next round
////            print("I think it worked. ")
////            print("String array: \(labelTextArray)")
////            print("firstArray array: \(answerArray)")
//        } else {
////            print("Error COMPARABLE DID NOT WORK")
//            //show next round button
//            nextRound()
//            nextRoundProperties.setImage(UIImage(named: "next_round_fail"), for: .normal)
//        }
    }
    
    func nextRound(){
        //show next round button
        nextRoundProperties.isHidden = false
        nextRoundProperties.layer.cornerRadius = 12
        nextRoundProperties.clipsToBounds = true
//        //add round
//        eventController.addRound()
//        //clearCurrentArray
//        eventController.clearCurrentArray()
    }
}

extension EventViewController {
    
    func createTimer(){
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(startTimer), userInfo: nil, repeats: true)
    }
    
    @objc func startTimer(){
//        print("Timer fired")
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
        countDown = 60
        timerLabel.text = timeFormatter.string(from: countDown)
    }
    
    func timesUpAlert(){
       let alert = UIAlertController(title: "Time is up!", message: "You let the time run out.", preferredStyle: .alert)
        let nextRoundAction = UIAlertAction(title: "Next Round", style: .default) { (_) in
           self.eventController.round += 1
            self.loadLabels()
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
