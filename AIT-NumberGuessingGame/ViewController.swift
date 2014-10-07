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
    //  gradientInit()
        self.backgroundView.backgroundColor = UIColor.redColor()
        sliderNumberView.text = "5"
        playAgainButton.enabled = false
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /* Use to init gradient, decided not to use it
    func gradientInit() {
        let darkBlue: CGColorRef = UIColor(red: 66.0/255.0, green: 113.0/255.0, blue: 242.0/255.0, alpha: 1).CGColor
        let lightBlue: CGColorRef = UIColor(red: 129.0/255.0, green: 242.0/255.0, blue: 253.0/255.0, alpha: 1).CGColor
        let arrayColors: NSArray = [lightBlue, darkBlue]
        
        let gl: CAGradientLayer = CAGradientLayer()
        gl.colors = arrayColors
        gl.locations = [0.0, 0.5]
        gl.frame = backgroundView.bounds
        
        backgroundView.layer.insertSublayer(gl, atIndex: 0)
    }
        */

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
            //playAgainButton.alpha = 1
            playAgainButton.enabled = true
            
            playAgainButton.alpha = 0.0
            UIView.animateWithDuration(2, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.7, options: .CurveEaseIn, animations: {
                self.backgroundView.backgroundColor = UIColor.blueColor()
                self.playAgainButton.alpha = 1.0
                self.playAgainButton.center = CGPoint(x: 10, y: 100)
                }, completion: nil)
        }
    }

    @IBAction func playAgainButtonAction(sender: AnyObject) {
        targetValue = Int(arc4random_uniform(10))
        feedbackText.text = "Make A Guess!"
        
        
        UIView.animateWithDuration(0.8, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.8,
            options: .CurveEaseOut
            , animations: {
            self.playAgainButton.alpha = 0.0
            self.backgroundView.backgroundColor = UIColor.redColor()
            }, completion: nil)
        
        playAgainButton.enabled = false
    }
}

