//
//  ViewController.swift
//  KHL Scoreboard
//
//  Created by Jason Hilimire on 12/2/16.
//  Copyright © 2016 Peanut Apps. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var minutes = 30
    var timer = Timer()
    var timeCount = 600
    var timeInterval:TimeInterval = 1
    var audioPlayer = AVAudioPlayer()
    
    func timeString(time:TimeInterval) -> String {
        let minutes = Int(time) / 60
        //let seconds = Int(time) % 60
        let seconds = time - Double(minutes) * 60
        //let secondsFraction = seconds - Double(Int(seconds))
        return String(format:"%02i:%02i",minutes,Int(seconds))
    }
    
    
    func decreaseTimer() {
        
        if timeCount > 0 {
            timeCount -=  1
            timelabel.text = timeString(time: TimeInterval(timeCount))
            
        } else if timeCount == 0 {
            
            timer.invalidate()
            audioPlayer.play()
            
        }
        
    }

    
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
    @IBOutlet weak var awayLabel: UILabel!
    
// Timer
    
    @IBOutlet weak var timelabel: UILabel!
    
// Slider
    @IBOutlet weak var sliderOutlet: UISlider!
    @IBAction func slider(_ sender: UISlider) {
        minutes = Int(sender.value) * 60
        timelabel.text = timeString(time: TimeInterval(minutes))
        timeCount = minutes
    }
    
    
    
// Toolbar
    
    @IBOutlet weak var playOutlet: UIBarButtonItem!
    @IBAction func playButton(_ sender: Any) { // Starts the Timer
        
      
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.decreaseTimer), userInfo: nil, repeats: true)
       
        sliderOutlet.isHidden = true
        playOutlet.isEnabled = false
        newGameOutlet.isEnabled = false
        
        
    }
    
  
    @IBAction func pauseButton(_ sender: Any) { //Pauses the Timer
        timer.invalidate()
        sliderOutlet.isHidden = false
        playOutlet.isEnabled = true
        newGameOutlet.isEnabled = true
        audioPlayer.stop()
        
    }
  
    @IBOutlet weak var newGameOutlet: UIBarButtonItem!
    @IBAction func newGameButton(_ sender: Any) {  // Resets scores to zero and returns clock to default
        timeCount = 600
        
        timelabel.text = timeString(time: TimeInterval(timeCount))
        homeScore.text = String(0)
        homeStepper.value = 0
        awayScore.text = String(0)
        awayStepper.value = 0
        sliderOutlet.isHidden = false
    }
    
   
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        do
        {
            let audioPath = Bundle.main.path(forResource: "Airhorn", ofType: ".mp3")
            try audioPlayer = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath!))
        }
        catch
        {
            //ERROR
        }
        
        homeScore.layer.borderWidth = 1
        homeLabel.layer.borderWidth = 1
        awayScore.layer.borderWidth = 1
        awayLabel.layer.borderWidth = 1
    }



}

