//
//  ViewController.swift
//  MagicEightBall
//
//  Created by Raymond MBP on 11/30/19.
//  Copyright © 2019 Make School. All rights reserved.
//

import Foundation
import UIKit

class ViewController: UIViewController {
    
    let answers = ["Yes, definitely", "It is certain", "Without a doubt", "Yes", "Most likely", "Sure, why not?", "Same", "Tell me more", "Out to lunch", "Reply hazy, try again", "Ask again later", "The cake is a lie", "42", "TMI", "Very doubtful", "Don't count on it", "My reply is no", "Absolutely not"]

    @IBOutlet weak var answerLabel: UILabel!
    @IBOutlet weak var shakeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func shakeButtonTapped(_ sender: Any) {
        print("Shake it like a polaroid picture!")

//        // 1
//        let maxIndex = UInt32(answers.count)
//        // 2
//        let randomIndex = Int(arc4random_uniform(maxIndex))
//
//        // 3
//        answerLabel.text = answers[randomIndex]
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        guard motion == .motionShake else { return }
        
        let maxIndex = UInt32(answers.count)
        let randomIndex = Int(arc4random_uniform(maxIndex))
        
        answerLabel.text = answers[randomIndex]
    }
    
    func generateAnswer() {
        let maxIndex = UInt32(answers.count)
        let randomIndex = Int(arc4random_uniform(maxIndex))
        
        answerLabel.text = answers[randomIndex]
    }
}
