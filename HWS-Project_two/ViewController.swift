//
//  ViewController.swift
//  HWS-Project_two
//
//  Created by Seyyedfarid Kamizi on 6/30/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var flagOne: UIButton!
    @IBOutlet var flagTwo: UIButton!
    @IBOutlet var flagThree: UIButton!
    
    var countries: [String] = []
    var score = 0
    var correctAnswer = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        
        flagOne.layer.borderWidth = 1
        flagTwo.layer.borderWidth = 1
        flagThree.layer.borderWidth = 1
        
        flagOne.layer.borderColor = UIColor.lightGray.cgColor
        flagTwo.layer.borderColor = UIColor.lightGray.cgColor
        flagThree.layer.borderColor = UIColor.lightGray.cgColor
        
        askQuestion(action: nil)
    }

    func askQuestion(action: UIAlertAction!) {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        flagOne.setImage(UIImage(named: countries[0]), for: .normal)
        flagTwo.setImage(UIImage(named: countries[1]), for: .normal)
        flagThree.setImage(UIImage(named: countries[2]), for: .normal)
        
        title = countries[correctAnswer].uppercased()
    }

    
    @IBAction func flagTapped(_ sender: UIButton) {
        var title: String
        if(sender.tag == correctAnswer) {
            title = "Correct"
            score += 1
        } else {
            title = "Wrong"
            score -= 1
        }
        
        let ac = UIAlertController(title: title, message: "Your score is \(score)", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
        present(ac, animated: true)
    }
    
}

