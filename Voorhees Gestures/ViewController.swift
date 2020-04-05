//
//  ViewController.swift
//  Voorhees Gestures
//
//  Created by Caleb Voorhees on 3/30/20.
//  Copyright © 2020 Caleb Voorhees. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var outputLabel: UILabel!
    @IBOutlet weak var bradImage: UIImageView!
    @IBOutlet weak var youngBradImage: UIImageView!
    @IBOutlet weak var professorImage: UIImageView!
    
    // On tap show image of Brad
    @IBAction func foundTap(_ sender: Any) {
        bradImage.isHidden = false
        bradImage.startAnimating()
        outputLabel.text = "What a nice image! Now swipe to reverse time."
        
    // Hide all other images
        if youngBradImage.isAnimating || professorImage.isAnimating
        {
            youngBradImage.isHidden = true
            professorImage.isHidden = true
        }
        
    }
    
    // On swipe change image to young brad
    @IBAction func foundSwipe(_ sender: Any) {
        youngBradImage.isHidden = false
        youngBradImage.startAnimating()
        outputLabel.text = "Hi younger Brad! Now lets shake things up a bit."
        
    // Hide all other images
        if bradImage.isAnimating || professorImage.isAnimating
        {
            bradImage.isHidden = true
            professorImage.isHidden = true
        }
        
       
    }
    
    // On shake change image to best professor
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        
        if motion==UIEvent.EventSubtype.motionShake {
            professorImage.isHidden = false
            professorImage.startAnimating()
            outputLabel.text = "Thanks for all you do!"
           
    // Hide all other images
            if bradImage.isAnimating || youngBradImage.isAnimating
            {
                bradImage.isHidden = true
                youngBradImage.isHidden = true
            }
        }
    }
    
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let bradAnimation: [UIImage] = [UIImage(named: "brad")!,]
        bradImage.animationImages = bradAnimation
        
        let youngBradAnimation: [UIImage] = [UIImage(named: "young brad")!,]
        youngBradImage.animationImages = youngBradAnimation
        
        let bestProfessorAnimation: [UIImage] = [UIImage(named: "best professor")!,]
        professorImage.animationImages = bestProfessorAnimation
        
    }


}

