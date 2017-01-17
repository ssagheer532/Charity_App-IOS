//
//  Charity_ListViewController.swift
//  Charity App
//
//  Created by Ahad Sagheer on 1/14/17.
//  Copyright © 2017 Ahad Sagheer. All rights reserved.
//

import UIKit
import GoogleMobileAds
class Charity_ListViewController: UIViewController {
    
    
    
    var advertisement: GADInterstitial
    
    
    @IBOutlet weak var ad: UIButton!
    
    func createAd() -> GADInterstitial {
        let request  = GADInterstitial(adUnitID: "ca-app-pub-3940256099942544/1033173712")
        
        advertisement.delegate = self
        advertisement.load(request)
        return advertisement
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //ad.adChoicesView.inters
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
