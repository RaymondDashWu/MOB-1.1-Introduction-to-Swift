//
//  ViewController.swift
//  new_eight_ball
//
//  Created by Raymond MBP on 12/11/19.
//  Copyright © 2019 Make School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Properties

    let answers = ["Make School", "Uber", "Netflix", "Facebook", "Google", "Kickstarter", "Spotify", "Airbnb", "Snapchat", "YouTube", "Dropbox", "Amazon", "Craigslist", "Tinder", "Instagram", "Tesla", "Twitter", "SpaceX"]
    
    let answers2 = ["Dogs", "Books", "Gamers", "Star Wars", "Bitcoin", "Goats", "Zombies", "Rich People", "Swimmers", "Florida", "Vampires", "Dragons", "Internet of Things", "Mars", "Cryptocurrency", "Mosquito Repellent", "Fidget Spinners", "Sun Screen", "Water Bottles", "Lost Travelers", "Superheroes"]



    @IBOutlet weak var answerLabel: UILabel!
    @IBOutlet weak var answerLabel2: UILabel!
    @IBOutlet weak var shakeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func generateAnswer() {
        let randomIndex = Int.random(in: 0..<answers.count)

        answerLabel.text = answers[randomIndex]
        answerLabel2.text = answers2[randomIndex]
    }

    @IBAction func shakeButtonTapped(_ sender: Any) {
        generateAnswer()
    }

    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        guard motion == .motionShake else { return }

        generateAnswer()
    }
    
}

