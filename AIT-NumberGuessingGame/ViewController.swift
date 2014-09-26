//
//  ViewController.swift
//  AIT-NumberGuessingGame
//
//  Created by Patrick on 9/26/14.
//  Copyright (c) 2014 Patrick Triest. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var backgroundView: UIView!

    @IBOutlet weak var numberSlider: UISlider!

    @IBOutlet weak var sliderNumberView: UILabel!
    
    @IBOutlet weak var feedbackText: UILabel!
    
    @IBOutlet weak var playAgainButton: UIButton!
    
    var targetValue: Int = Int(arc4random_uniform(10))
    var currentValue: Int = 5

    
    override func viewDidLoad() {
        super.viewDidLoad()
        sliderNumberView.text = "5"
        gradientInit()
        playAgainButton.enabled = false
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func gradientInit() {
        let darkBlue: CGColorRef = UIColor(red: 66.0/255.0, green: 113.0/255.0, blue: 242.0/255.0, alpha: 1).CGColor
        
        let lightBlue: CGColorRef = UIColor(red: 129.0/255.0, green: 242.0/255.0, blue: 253.0/255.0, alpha: 1).CGColor
        
        let arrayColors: NSArray = [lightBlue, darkBlue]
        
        let gl: CAGradientLayer = CAGradientLayer()
        gl.colors = arrayColors
        gl.locations = [ 0.0, 1.0]
        gl.frame = backgroundView.bounds
        
        backgroundView.layer.insertSublayer(gl, atIndex: 0)
    }
    
    @IBAction func numberSliderAction(sender: AnyObject) {
        currentValue = Int(numberSlider.value * 10)
        var valueString = NSString(format: "%d", currentValue)
        sliderNumberView.text = valueString
    }

    @IBAction func guessButtonAction(sender: AnyObject) {
        if (currentValue < targetValue){
            feedbackText.text = "Go Higher"
        }
        else if (currentValue > targetValue) {
            feedbackText.text = "Go Lower"
        }
        else {
            feedbackText.text = "You Win!"
            playAgainButton.alpha = 1
            playAgainButton.enabled = true
        }
    }

    @IBAction func playAgainButtonAction(sender: AnyObject) {
        targetValue = Int(arc4random_uniform(10))
        feedbackText.text = "Make A Guess!"
        playAgainButton.alpha = 0
        playAgainButton.enabled = false
    }
}

