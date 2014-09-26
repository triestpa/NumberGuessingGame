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

    
    override func viewDidLoad() {
        super.viewDidLoad()
        gradientInit()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func gradientInit() {
        let darkBlue: CGColorRef = UIColor(red: 29.0/255.0, green: 119.0/255.0, blue: 239.0/255.0, alpha: 1).CGColor
        
        let lightBlue: CGColorRef = UIColor(red: 129.0/255.0, green: 243.0/255.0, blue: 253.0/255.0, alpha: 1).CGColor
        
        let arrayColors: NSArray = [lightBlue, darkBlue]
        
        let gl: CAGradientLayer = CAGradientLayer()
        gl.colors = arrayColors
        gl.locations = [ 0.0, 1.0]
        gl.frame = backgroundView.bounds
        
        backgroundView.layer.insertSublayer(gl, atIndex: 0)
    }
    
    @IBAction func numberSliderAction(sender: AnyObject) {
        var value = floor(numberSlider.value * 100)
        println(value)
    }


}

