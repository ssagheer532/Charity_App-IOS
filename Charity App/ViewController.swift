//
//  ViewController.swift
//  Charity App
//
//  Created by Ahad Sagheer on 1/4/17.
//  Copyright © 2017 Ahad Sagheer. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //var movementX = 0.1
    //var movementY = 0.1
    var cordinate2dArray: [[Double]] = [ [0.1, 0.1], [0.1, 0.1]]
    
    
    @IBAction func moveButton(_ button: UIButton) {
   
        var movementX = 0.1
        var movementY = 0.1
        
        if (button.tag == 2){
            movementX = cordinate2dArray[1][0]
            movementY = cordinate2dArray[1][1]
        }
        
        
        if (button.tag == 1){
            movementX = cordinate2dArray[0][0]
            movementY = cordinate2dArray[0][1]
        }
        
        if button.center.x >= view.frame.maxX {
            movementX = -movementX
        }
        if button.center.x <= view.frame.minX {
            movementX = -movementX
        }
        if button.center.y >= view.frame.maxY {
            movementY = -movementY
        }
        if button.center.y <= view.frame.minY {
            movementY = -movementY
        }
        
        
        button.center.x = button.center.x + CGFloat(movementX)
        button.center.y = button.center.y + CGFloat(movementY)

        if (button.tag == 1){
            cordinate2dArray[0][0] = movementX
            cordinate2dArray[0][1] = movementY
        }
        if (button.tag == 2){
            cordinate2dArray[1][0] = movementX
            cordinate2dArray[1][1] = movementY
        }
    }
    
    
    @IBOutlet weak var temp: UILabel!
    
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    
    
    var timer = Timer()
    
    
    var counter = 0
    func scheduledTimerWithTimeInterval(){
        // Scheduling timer to Call the function **Countdown** with the interval of 1 seconds
        timer = Timer.scheduledTimer(timeInterval: 0.001, target: self, selector: #selector(self.updateCounting), userInfo: nil, repeats: true)
    }
    
    func updateCounting(){
        temp.text! = String(counter)
        counter += 1
        moveButton(button2)
       moveButton(button1)

    }
    
    
    
    override func viewDidLoad() {
        button1.tag = 1
        button2.tag = 2
        
     
        
        
        
        scheduledTimerWithTimeInterval()
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

