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
        navigationController?.popToRootViewController(animated: true)
    }
    
    func updateViews(){
        guard let eventController = eventController, isViewLoaded else  { print("blah blah blah"); return }
        print("eventController is set")
        scoreLabel.text = "\(eventController.points)/6"
    }
}