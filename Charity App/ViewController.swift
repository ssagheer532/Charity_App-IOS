//
//  ViewController.swift
//  Charity App
//
//  Created by Ahad Sagheer on 1/4/17.
//  Copyright © 2017 Ahad Sagheer. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func moveButton(_ button: UIButton) {
        
        
        let buttonWidth = button.frame.width
        let buttonHeight = button.frame.height
        
        // Find the width and height of the enclosing view
        let viewWidth = button.superview!.bounds.width
        let viewHeight = button.superview!.bounds.height
        
        // Compute width and height of the area to contain the button's center
        let xwidth = viewWidth - buttonWidth
        let yheight = viewHeight - buttonHeight
        
        // Generate a random x and y offset
        let xoffset = CGFloat(arc4random_uniform(UInt32(xwidth)))
        let yoffset = CGFloat(arc4random_uniform(UInt32(yheight)))
        
        // Offset the button's center by the random offsets.
        button.center.x = xoffset + buttonWidth / 2
        button.center.y = yoffset + buttonHeight / 2
    }
    
    
    @IBOutlet weak var temp: UILabel!
    
    @IBOutlet weak var button2: UIButton!
    
    
    var timer = Timer()
    
 
    var counter = 0
    func scheduledTimerWithTimeInterval(){
        // Scheduling timer to Call the function **Countdown** with the interval of 1 seconds
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.updateCounting), userInfo: nil, repeats: true)
    }
    
    func updateCounting(){
        temp.text! = String(counter)
        counter += 1
        moveButton(button2)
    }
    
    
    
    override func viewDidLoad() {
        scheduledTimerWithTimeInterval()

        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

