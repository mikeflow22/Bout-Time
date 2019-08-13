//
//  FinalScoreViewController.swift
//  BoutTime
//
//  Created by Michael Flowers on 8/12/19.
//  Copyright © 2019 Michael Flowers. All rights reserved.
//

import UIKit

class FinalScoreViewController: UIViewController {
    var eventController: EventController? {
        didSet {
            print("B")
            updateViews()
        }
    }
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var playAgainProperties: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("A")
        updateViews()
        // Do any additional setup after loading the view.
        playAgainProperties.backgroundColor = .gray
        playAgainProperties.layer.cornerRadius = 12
    }
    
    @IBAction func playAgainButtonPressed(_ sender: UIButton) {
        print("play again button pressed.")
        guard let eventController = eventController else { return }
        eventController.round = 0
        eventController.points = 0
        self.dismiss(animated: true, completion: nil)
    }
    
    func updateViews(){
        guard let eventController = eventController, isViewLoaded else  { print("blah blah blah"); return }
        print("eventController is set")
        scoreLabel.text = "\(eventController.points)/6"
        print("score: \(eventController.points)")
    }
}
