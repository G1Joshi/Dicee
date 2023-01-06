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

    let mainStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .fill
        stack.distribution = .fillEqually
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()

    let diceStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 75
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()

    let player1StackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()

    let player2StackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()

    let scoreStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 150
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()

    let logoView: UIView = UIView()
    let diceView: UIView = UIView()
    let buttonView: UIView = UIView()
    let scoreView: UIView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(background)
        view.addSubview(mainStackView)

        mainStackView.addArrangedSubview(logoView)
        mainStackView.addArrangedSubview(diceView)
        mainStackView.addArrangedSubview(buttonView)
        mainStackView.addArrangedSubview(scoreView)

        logoView.addSubview(diceLogo)

        diceView.addSubview(diceStackView)
        diceStackView.addArrangedSubview(diceImage1)
        diceStackView.addArrangedSubview(diceImage2)

        buttonView.addSubview(rollButton)

        scoreView.addSubview(scoreStackView)
        scoreStackView.addArrangedSubview(player1StackView)
        scoreStackView.addArrangedSubview(player2StackView)
        player1StackView.addArrangedSubview(player1)
        player1StackView.addArrangedSubview(score1)
        player2StackView.addArrangedSubview(player2)
        player2StackView.addArrangedSubview(score2)

        NSLayoutConstraint.activate([
            background.topAnchor.constraint(equalTo: view.topAnchor),
            background.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            background.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            background.trailingAnchor.constraint(equalTo: view.trailingAnchor),

            mainStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            mainStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),

            diceLogo.centerXAnchor.constraint(equalTo: logoView.centerXAnchor),
            diceLogo.centerYAnchor.constraint(equalTo: logoView.centerYAnchor),

            diceStackView.centerXAnchor.constraint(equalTo: diceView.centerXAnchor),
            diceStackView.centerYAnchor.constraint(equalTo: diceView.centerYAnchor),

            rollButton.centerXAnchor.constraint(equalTo: buttonView.centerXAnchor),
            rollButton.centerYAnchor.constraint(equalTo: buttonView.centerYAnchor),
            rollButton.widthAnchor.constraint(equalToConstant: 150),
            rollButton.heightAnchor.constraint(equalToConstant: 75),

            scoreStackView.centerXAnchor.constraint(equalTo: scoreView.centerXAnchor),
            scoreStackView.centerYAnchor.constraint(equalTo: scoreView.centerYAnchor),
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
