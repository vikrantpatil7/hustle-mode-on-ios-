//
//  ViewController.swift
//  hustle-mode
//
//  Created by Vikrant  Patil on 4/22/18.
//  Copyright © 2018 Vikrant  Patil. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var darkBlueBG: UIImageView!
    @IBOutlet weak var PowerBtn: UIButton!
    @IBOutlet weak var CloudHolder: UIView!
    @IBOutlet weak var Rocket: UIImageView!
    @IBOutlet weak var hustleLbl: UILabel!
    @IBOutlet weak var onLbl: UILabel!
    
    var player: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let path = Bundle.main.path(forResource: "hustle-on", ofType: "wav")!
        let url = URL(fileURLWithPath: path)
        do{
            player = try AVAudioPlayer(contentsOf: url)
            player.prepareToPlay()
        }catch let error as NSError{
            print(error.description)
        }
        
    }

    
    @IBAction func powerButtonPressed(_ sender: Any) {
        CloudHolder.isHidden = false
        darkBlueBG.isHidden = true
        PowerBtn.isHidden = true
        
        player.play()
        
        UIView.animate(withDuration: 2.3, animations: {
            self.Rocket.frame = CGRect(x: 0, y: 20, width: 375, height: 248)
        }) { (finished) in
            self.hustleLbl.isHidden = false
            self.onLbl.isHidden = false
        }
    }
    
}

