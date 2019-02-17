//
//  ViewController.swift
//  BullsEye
//
//  Created by zeyad on 2/13/19.
//  Copyright © 2019 zeyad. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //Outlets
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var randomLbl: UILabel!
    @IBOutlet weak var scoreLbl: UILabel!
    @IBOutlet weak var roundLbl: UILabel!
    
    //Variables
    var targetValue: Int = 0
    var currentValue: Int = 50
    var score: Int  = 0
    var round: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startNewRound()
        
        let imageThumpNormal = #imageLiteral(resourceName: "SliderThumb-Normal")
        slider.setThumbImage(imageThumpNormal, for: .normal)
        
        let imageThumpHalighted = #imageLiteral(resourceName: "SliderThumb-Highlighted")
        slider.setThumbImage(imageThumpHalighted, for: .highlighted)
        
        let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
        let trackLeftImage = #imageLiteral(resourceName: "SliderTrackLeft")
        let trackLeftImageResizable = trackLeftImage.resizableImage(withCapInsets: insets)
        slider.setMinimumTrackImage(trackLeftImageResizable, for: .normal)
        
        let trackRightImage = #imageLiteral(resourceName: "SliderTrackRight")
        let trackRightImageResizable = trackRightImage.resizableImage(withCapInsets: insets)
        slider.setMaximumTrackImage(trackRightImageResizable, for: .normal)
        
        
    }
    
    @IBAction func hitMeBtnPressed(){
        
        let difference = abs(targetValue - currentValue)
        var points = 100 - difference
        score += points
    
        
        let title: String
        if difference == 0 {
            title = "Perfect! "
            points += 100
        }else if difference < 5 {
            title = "Pretty close !"
            if difference == 1 {
                points += 50
            }
        }else if difference < 10 {
            title = "You almost got it !"
        }else {
            title = "Not even close..."
        }
        let message = "You scored: \(points)"
        
        let alert = UIAlertController(title: title, message: message , preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Awesome", style: .default, handler:{
            action in
            self.startNewRound()
        } )
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        
    }
    
    @IBAction func sliderPrssed(_ sender: Any) {
        currentValue = Int(slider.value.rounded())
    }
    
    @IBAction func resetBtnPressed(_ sender: Any) {
        score = 0
        round = 0
        startNewRound()
    }
    
    func startNewRound(){
        round += 1
        targetValue = Int.random(in: 1...100)
        slider.value = 50
        updateLabels()
    }
    func updateLabels(){
        randomLbl.text = "\(targetValue)"
        scoreLbl.text = "\(score)"
        roundLbl.text = "\(round)"
    }
    
    
}

