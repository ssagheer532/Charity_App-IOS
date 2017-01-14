//
//  ViewController.swift
//  Charity App
//
//  Created by Ahad Sagheer on 1/4/17.
//  Copyright © 2017 Ahad Sagheer. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var cordinate2dArray: [[Double]] = [ [0.3, 0.3], [0.3, 0.3], [0.3, 0.3]]
  
    
    var numberOfButtons = 10
    @IBAction func moveButton(_ button: UIButton) {
        var movementX = 0.2
        var movementY = 0.2
        
        movementX = cordinate2dArray[button.tag-1][0]
        movementY = cordinate2dArray[button.tag-1][1]
        
        
        if button.center.x >= view.frame.maxX {
            movementX = -movementX
        }
        if button.center.x <= view.frame.minX+1 {
            movementX = -movementX
        }
        if button.center.y >= view.frame.maxY {
            movementY = -movementY
        }
        if button.center.y <= view.frame.minY+1 {
            movementY = -movementY
        }
        
        
        button.center.x = button.center.x + CGFloat(movementX)
        button.center.y = button.center.y + CGFloat(movementY)
        
        cordinate2dArray[button.tag-1][0] = movementX
        cordinate2dArray[button.tag-1][1] = movementY
        bounceOff(button: button)
        
    }
    
    func bounceOff(button: UIButton){
        
        let buttonX1 = button.center.x + (button.frame.width/2)
        let buttonX2 = button.center.x - (button.frame.width/2)
        let buttonY1 = button.center.y + (button.frame.height/2)
        let buttonY2 = button.center.y - (button.frame.height/2)
        
        for view in self.view.subviews as [UIView] {
            
            
            if let btn = view as? UIButton{
                if btn.tag == 0 {
                continue
                }
                
                let buttonCurrentX1 = btn.center.x + (btn.frame.width/2)
                let buttonCurrentX2 = btn.center.x - (btn.frame.width/2)
                let buttonCurrentY1 = btn.center.y + (btn.frame.height/2)
             //   let buttonCurrentY2 = btn.center.y - (btn.frame.height/2)
                
                if (buttonCurrentX2 > buttonX2 && buttonCurrentX2 < buttonX1) ||
                   (buttonCurrentX1 < buttonX1 && buttonCurrentX1 > buttonX2){
                    
                    if (buttonCurrentY1 < buttonY1 && buttonCurrentY1 > buttonY2) ||
                       (buttonCurrentY1 > buttonY1 && buttonCurrentY1 < buttonY2){
                        
                        if cordinate2dArray[button.tag-1][1] == cordinate2dArray[btn.tag-1][1] {
                            cordinate2dArray[button.tag-1][0] =  -cordinate2dArray[button.tag-1][0]
                            cordinate2dArray[btn.tag-1][0] =  -cordinate2dArray[btn.tag-1][0]

                        }
                            
                        else if cordinate2dArray[button.tag-1][0] == cordinate2dArray[btn.tag-1][0] {
                            cordinate2dArray[button.tag-1][1] =  -cordinate2dArray[button.tag-1][1]
                            cordinate2dArray[btn.tag-1][1] =  -cordinate2dArray[btn.tag-1][1]
                            
                        }
                            
                        else{

                        cordinate2dArray[button.tag-1][0] =  -cordinate2dArray[button.tag-1][0]
                        cordinate2dArray[button.tag-1][1] =  -cordinate2dArray[button.tag-1][1]
                        cordinate2dArray[btn.tag-1][0] =  -cordinate2dArray[btn.tag-1][0]
                        cordinate2dArray[btn.tag-1][1] =  -cordinate2dArray[btn.tag-1][1]
                        }
                        
                    }
                }

            }
        }
    }
    
    
    @IBOutlet weak var temp: UILabel!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var menuItem1: UIButton!
    
    var timer = Timer()
    
    
    @IBAction func button1Pressed(_ sender: UIButton) {
        
        
        sender.center.x = -50//bring button off screen
        sender.center.y = -50

        sender.isHidden = true
        
        
    }
    func scheduledTimerWithTimeInterval(){
        // Scheduling timer to Call the function **Countdown** with the interval of 1 seconds
        timer = Timer.scheduledTimer(timeInterval: 0.004, target: self, selector: #selector(self.updateCounting), userInfo: nil, repeats: true)
    }
    
    func updateCounting(){
        moveButton(button2)
        moveButton(button1)
        moveButton(button3)
        
    }
    
    override func viewDidLoad() {
        button1.tag = 1
        button2.tag = 2
        button3.tag = 3
        menuItem1.tag = 0
        
        scheduledTimerWithTimeInterval()
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

