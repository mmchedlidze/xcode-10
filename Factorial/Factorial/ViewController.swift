//
//  ViewController.swift
//  Factorial
//
//  Created by Mariam Mchedlidze on 08.11.23.
//

import UIKit

class ViewController: UIViewController {
    let stackview: UIStackView = {
        let stack = UIStackView()
        return stack
    }()

    let generateButton: UIButton = {
        let button = UIButton()
        return button
    }()

    let resultLabel: UILabel = {
        let label = UILabel()
        return label
    }()

    let resultLabel2: UILabel = {
        let label = UILabel()
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        setupStackview()
    }

    private func setupStackview() {
        view.addSubview(stackview)
        stackview.axis = .vertical
        stackview.spacing = 20
        setupButton()
        setupLabel()
        setupLabel2()
        buttonRestrictions()
        labelRestrictions()
        labelRestrictions2()
    }

    private func setupButton() {
        stackview.addArrangedSubview(generateButton)
        generateButton.setTitle("Generate", for: .normal)
        generateButton.layer.borderColor = UIColor.white.cgColor
        generateButton.layer.borderWidth = 2
      
        generateButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
    }

    private func setupLabel() {
        stackview.addArrangedSubview(resultLabel)
        resultLabel.textAlignment = .center
        resultLabel.layer.borderColor = UIColor.white.cgColor
        resultLabel.layer.borderWidth = 2
        resultLabel.textColor = .white
        resultLabel.numberOfLines = 3
        resultLabel.textAlignment = .left
        resultLabel.lineBreakMode = .byWordWrapping
    
    }

    private func setupLabel2() {
        stackview.addArrangedSubview(resultLabel2)
        resultLabel2.textAlignment = .center
        resultLabel2.layer.borderColor = UIColor.white.cgColor
        resultLabel2.layer.borderWidth = 2
        resultLabel2.textColor = .white
    }

    private func buttonRestrictions() {
        stackview.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackview.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            stackview.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            generateButton.heightAnchor.constraint(equalToConstant: 50),
            generateButton.widthAnchor.constraint(equalToConstant: 100)
        ])
    }

    private func labelRestrictions() {
        resultLabel.translatesAutoresizingMaskIntoConstraints = false
        resultLabel.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -40).isActive = true
        
    }

    private func labelRestrictions2() {
        resultLabel2.translatesAutoresizingMaskIntoConstraints = false
        resultLabel2.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -40).isActive = true
    }

    @objc func buttonAction(sender: UIButton!) {
        DispatchQueue.global().async {
            let number1 = Int.random(in: 20...50)
            let number2 = Int.random(in: 20...50)

            let factorial1 = self.calculateFactorial(of: Double(number1))
            let factorial2 = self.calculateFactorial(of: Double(number2))

            let resultString = "Factorial of \(number1) is \(factorial1), Factorial of \(number2) is \(factorial2)"

            var winnerString = ""
            if factorial1 > factorial2 {
                winnerString = "\(number1)!"
            } else if factorial2 > factorial1 {
                winnerString = "\(number2)!"
            } else {
                winnerString = "Both numbers have equal factorials."
            }

            DispatchQueue.main.async {
                self.resultLabel.text = resultString
                self.resultLabel2.text = winnerString
            }
        }
    }

    func calculateFactorial(of number: Double) -> Double {
        if number == 0 {
            return 1
        }

        var result = 1.0
        for i in 1...Int(number) {
            result *= Double(i)
        }
        return result
    }
}
