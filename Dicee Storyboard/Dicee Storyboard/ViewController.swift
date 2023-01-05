//
//  ViewController.swift
//  Dicee Storyboard
//
//  Created by Jeevan Chandra Joshi on 05/01/23.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var diceImage1: UIImageView!
    @IBOutlet var diceImage2: UIImageView!
    @IBOutlet var player1: UILabel!
    @IBOutlet var player2: UILabel!

    var score1 = 0, score2 = 0

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func diceRolled(_ sender: UIButton) {
        var score = Int.random(in: 1 ... 6)
        diceImage1.image = UIImage(named: "dice\(score)")
        score1 += score
        player1.text = String(score1)

        score = Int.random(in: 1 ... 6)
        diceImage2.image = UIImage(named: "dice\(score)")
        score2 += score
        player2.text = String(score2)
    }
}
