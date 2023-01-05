//
//  ViewController.swift
//  Dicee Programmatic
//
//  Created by Jeevan Chandra Joshi on 05/01/23.
//

import UIKit

class ViewController: UIViewController {
    var player1score = 0, player2score = 0

    let background: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "background")
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    let diceLogo: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "diceeLogo")
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    let diceImage1: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "dice1")
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    let diceImage2: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "dice2")
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    let rollButton: UIButton = {
        let button = UIButton()
        button.configuration = .borderedTinted()
        button.configuration?.title = "Roll"
        button.tintColor = .white
        button.addTarget(self, action: #selector(roll), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    let player1: UILabel = {
        let label = UILabel()
        label.text = "You"
        label.textColor = .white
        label.font = .systemFont(ofSize: 25)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let player2: UILabel = {
        let label = UILabel()
        label.text = "Bot"
        label.textColor = .white
        label.font = .systemFont(ofSize: 25)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let score1: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 30)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let score2: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 30)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(background)
        view.addSubview(diceLogo)
        view.addSubview(diceImage1)
        view.addSubview(diceImage2)
        view.addSubview(rollButton)
        view.addSubview(player1)
        view.addSubview(player2)
        view.addSubview(score1)
        view.addSubview(score2)

        NSLayoutConstraint.activate([
            background.topAnchor.constraint(equalTo: view.topAnchor),
            background.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            background.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            background.trailingAnchor.constraint(equalTo: view.trailingAnchor),

            diceLogo.topAnchor.constraint(equalTo: background.topAnchor, constant: 150),
            diceLogo.centerXAnchor.constraint(equalTo: background.centerXAnchor),

            diceImage1.leadingAnchor.constraint(equalTo: background.leadingAnchor, constant: 50),
            diceImage1.centerYAnchor.constraint(equalTo: background.centerYAnchor),

            diceImage2.trailingAnchor.constraint(equalTo: background.trailingAnchor, constant: -50),
            diceImage2.centerYAnchor.constraint(equalTo: background.centerYAnchor),

            rollButton.centerXAnchor.constraint(equalTo: background.centerXAnchor),
            rollButton.topAnchor.constraint(equalTo: diceLogo.bottomAnchor, constant: 300),
            rollButton.widthAnchor.constraint(equalToConstant: 150),
            rollButton.heightAnchor.constraint(equalToConstant: 75),

            player1.leadingAnchor.constraint(equalTo: background.leadingAnchor, constant: 50),
            player1.bottomAnchor.constraint(equalTo: background.bottomAnchor, constant: -150),

            player2.trailingAnchor.constraint(equalTo: background.trailingAnchor, constant: -50),
            player2.bottomAnchor.constraint(equalTo: background.bottomAnchor, constant: -150),

            score1.topAnchor.constraint(equalTo: player1.bottomAnchor, constant: 5),
            score1.leadingAnchor.constraint(equalTo: background.leadingAnchor, constant: 50),

            score2.topAnchor.constraint(equalTo: player2.bottomAnchor, constant: 5),
            score2.trailingAnchor.constraint(equalTo: background.trailingAnchor, constant: -50),
        ])
    }

    @objc func roll() {
        var score = Int.random(in: 1 ... 6)
        diceImage1.image = UIImage(named: "dice\(score)")
        player1score += score
        score1.text = String(player1score)
        if player1score >= 100 {
            let alert = UIAlertController(title: "You Won", message: "Play Again!", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default)
            alert.addAction(action)
            present(alert, animated: true) { [self] in
                player1score = 0
                score1.text = String(player1score)
                player2score = 0
                score2.text = String(player2score)
            }
        } else {
            score = Int.random(in: 1 ... 6)
            diceImage2.image = UIImage(named: "dice\(score)")
            player2score += score
            score2.text = String(player2score)
            if player2score >= 100 {
                let alert = UIAlertController(title: "Bot Won", message: "Play Again!", preferredStyle: .alert)
                let action = UIAlertAction(title: "OK", style: .default)
                alert.addAction(action)
                present(alert, animated: true) { [self] in
                    player1score = 0
                    score1.text = String(player1score)
                    player2score = 0
                    score2.text = String(player2score)
                }
            }
        }
    }
}
