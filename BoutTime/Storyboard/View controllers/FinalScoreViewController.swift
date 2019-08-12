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
            
        }
    }
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var playAgainProperties: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        playAgainProperties.layer.cornerRadius = 4
    }
    
    @IBAction func playAgainButtonPressed(_ sender: UIButton) {
        navigationController?.popToRootViewController(animated: true)
    }
    
}
