//
//  ViewController.swift
//  KHL Scoreboard
//
//  Created by Jason Hilimire on 12/2/16.
//  Copyright © 2016 Peanut Apps. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var minutes = 10
    var timer = Timer()

    
 // Controls Home Score
    @IBOutlet weak var homeScore: UILabel!
    @IBOutlet weak var homeStepper: UIStepper!
    @IBAction func homeScoreStepper(_ sender: Any) {
        
        homeScore.text = "\(Int(homeStepper.value))"
    }
    @IBOutlet weak var homeLabel: UILabel!
    
// Controls Away Score
    
    @IBOutlet weak var awayScore: UILabel!
    @IBOutlet weak var awayStepper: UIStepper!
    @IBAction func awayScoreStepper(_ sender: Any) {
        
        awayScore.text = "\(Int(awayStepper.value))"
    }
    
// Timer
    
    @IBOutlet weak var timelabel: UILabel!
    
// Slider
    @IBOutlet weak var sliderOutlet: UISlider!
    @IBAction func slider(_ sender: UISlider) {
        minutes = Int(sender.value)
        timelabel.text = String(minutes)
    }
    @IBOutlet weak var awayLabel: UILabel!
    
    
// Toolbar
    
    @IBAction func playButton(_ sender: Any) {
        
        
        sliderOutlet.isHidden = true
    }
    @IBAction func pauseButton(_ sender: Any) {
        
        sliderOutlet.isHidden = false
    }
  
    @IBAction func newGameButton(_ sender: Any) {  // Resets scores to zero and returns clock to default
        
        homeScore.text = String(0)
        awayScore.text = String(0)
        sliderOutlet.isHidden = false
    }
    
   
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        homeScore.layer.borderWidth = 1
        homeLabel.layer.borderWidth = 1
        awayScore.layer.borderWidth = 1
        awayLabel.layer.borderWidth = 1
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

