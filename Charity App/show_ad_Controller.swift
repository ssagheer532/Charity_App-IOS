//
//  Charity_ListViewController.swift
//  Charity App
//
//  Created by Ahad Sagheer on 1/14/17.
//  Copyright © 2017 Ahad Sagheer. All rights reserved.
//

import UIKit
import GoogleMobileAds
class Charity_ListViewController: UIViewController, GADInterstitialDelegate {
    
    
    var advertisement: GADInterstitial?
    
    
    @IBOutlet weak var ad: UIButton!
    
    @IBAction func showAd(_ sender: UIButton) {
        if advertisement != nil {
            if advertisement!.isReady {
                advertisement?.present(fromRootViewController: self)
            }
        }
        advertisement = createAd()

    }
    func createAd() -> GADInterstitial {
        let request = GADRequest()
        let interstitial  = GADInterstitial(adUnitID: "ca-app-pub-3940256099942544/1033173712")
        
        interstitial.delegate = self
        interstitial.load(request)
        return interstitial
    }
   
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        advertisement = createAd()
        //ad.adChoicesView.inters
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
