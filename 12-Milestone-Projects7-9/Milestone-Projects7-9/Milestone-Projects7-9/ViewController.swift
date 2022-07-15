//
//  ViewController.swift
//  Milestone-Projects7-9
//
//  Created by Ömer Oğuz Çelikel on 13.07.2022.
//

import UIKit

class ViewController: UIViewController {
    var imageView: UIImageView!
    var level = 1
    var correctLetters = [String]()
    var selectedWord = ""
    var answerText = "________"
    var allWords = [String]()
    var printAnswer = [String]()
    var usedLetters = [String]()
    var answerUILabel: UILabel!
    var currentAnswer: UITextField!
    var wrongAnswers = [Int]()
    var scoreLabel: UILabel!
    let alphabetArray =  ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"];
    var letterButtons = [UIButton]()
    
    var score = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        loadLevel()
        //startGame()
    }
    
    override func loadView() {
        view = UIView()
        view.backgroundColor = .systemYellow
        
        let buttonsView = UIView()
        buttonsView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(buttonsView)
        
        imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(imageView)
        
        answerUILabel = UILabel()
        answerUILabel.translatesAutoresizingMaskIntoConstraints = false
        answerUILabel.font = UIFont.systemFont(ofSize: 34)
        answerUILabel.textAlignment = .center
        answerUILabel.text = answerText
        answerUILabel.font = UIFont(name: "MarkerFelt-Thin", size: 40)
        view.addSubview(answerUILabel)
        
        scoreLabel = UILabel()
        scoreLabel.translatesAutoresizingMaskIntoConstraints = false
        scoreLabel.textAlignment = .right
        scoreLabel.text = "WIN: 0"
        scoreLabel.font = UIFont(name: "MarkerFelt-Thin", size: 34)
        view.addSubview(scoreLabel)
        
        NSLayoutConstraint.activate([
            
            
            scoreLabel.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 20),
            scoreLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -30),
            
            
            imageView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 70),
            imageView.widthAnchor.constraint(equalToConstant: 300),
            imageView.heightAnchor.constraint(equalToConstant: 300),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            //answerUILabel.topAnchor.constraint(equalTo: imageView.topAnchor, constant: 20),
            //answerUILabel.bottomAnchor.constraint(equalTo:  buttonsView.bottomAnchor, constant: 20),
            answerUILabel.centerXAnchor.constraint(equalTo: view.layoutMarginsGuide.centerXAnchor),
            answerUILabel.centerYAnchor.constraint(equalTo: view.layoutMarginsGuide.centerYAnchor),
            answerUILabel.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor, multiplier: 0.7),
            answerUILabel.heightAnchor.constraint(equalToConstant: 44),
            
            buttonsView.topAnchor.constraint(equalTo: answerUILabel.bottomAnchor, constant: 50),
            buttonsView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            buttonsView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -30),
            buttonsView.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor, constant: 0)
        ])
        
        let width = 50
        let height = 80
        var forAllWordsEvenOdd = 2
        for row in 0..<4 {
            if row % 2 == 0 {
                for column in 0..<6 {
                    let letterButton = UIButton(type: .system)
                    //letterButton.titleLabel?.font = UIFont.systemFont(ofSize: 30)
                    letterButton.titleLabel?.font = UIFont(name: "Noteworthy-Light", size: 30
                    )
                    letterButton.setTitleColor(UIColor.black, for: .normal)
                    letterButton.setTitle("W", for: .normal)
                    letterButton.addTarget(self, action: #selector(letterTapped), for: .touchUpInside)
                    //frame is place of the button
                    let frame = CGRect(x: column * width, y: row * height, width: width, height: height )
                    letterButton.frame = frame
                    
                    buttonsView.addSubview(letterButton)
                    letterButtons.append(letterButton)
                }
            } else {
                for column in 0..<7 {
                    let letterButton = UIButton(type: .system)
                    
                    letterButton.titleLabel?.font = UIFont(name: "Noteworthy-Light", size: 30)
                    //MarkerFelt-Thin, Noteworthy-Light
                    letterButton.setTitleColor(UIColor.black, for: .normal)
                    
                    letterButton.setTitle("W", for: .normal)
                    letterButton.addTarget(self, action: #selector(letterTapped), for: .touchUpInside)
                    //frame is place of the button
                    let frame = CGRect(x: column * width, y: row * height, width: width, height: height )
                    letterButton.frame = frame
                    
                    buttonsView.addSubview(letterButton)
                    letterButtons.append(letterButton)
                }
            }
            forAllWordsEvenOdd += 1
        }// row for
        //imageView.backgroundColor = .gray
        //answerUILabel.backgroundColor = .blue
        //buttonsView.backgroundColor = .brown
    } // loadview
    
    var countRightAnswerCount = 0
    var countWrongAnswerCount = 0
    @objc func letterTapped(_ sender: UIButton) {
        
        guard let buttonTitle = sender.titleLabel?.text else { return }
        var letterIndexCount = 0
        var isAnswerFalse = true
        for letter in selectedWord {
            letterIndexCount += 1
            if buttonTitle.contains(letter) {
                isAnswerFalse = false
                countRightAnswerCount += 1
                sender.isHidden = true
                let charButtonTitle = Character(buttonTitle)
                answerText = replace(myString: answerText, letterIndexCount-1, charButtonTitle)
                if countRightAnswerCount == 8 {
                    let ac = UIAlertController(title: "Well Done!", message: "Are you ready for the next level?", preferredStyle: .alert)
                    ac.addAction(UIAlertAction(title: "Let's go!", style: .default, handler: levelUp))
                    present(ac, animated: true)
                    countRightAnswerCount = 0
                    score += 1
                    level += 1
                }
            } else {
                //isAnswerFalse = true
                //countWrongAnswerCount += 1
                sender.setTitleColor(UIColor.red, for: .normal)
            }
        }
        answerUILabel.text = answerText.trimmingCharacters(in: .whitespaces)
        if isAnswerFalse{
            wrongAnswerFunc()
            
        }
        
    }
    func wrongAnswerFunc() {
        
        print("WrongAnswer")
        countWrongAnswerCount += 1
        print("countWrongAnswerCount:",countWrongAnswerCount)
        print ("hangman\(countWrongAnswerCount)")
        imageView.image = UIImage(named: "hangman\(countWrongAnswerCount)")
        if countWrongAnswerCount == 7 {
            score -= 1

            let ac = UIAlertController(title: "Sorry!", message: "Word to find was:\n\(selectedWord)", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default, handler: levelUp))
            present(ac, animated: true)
            countWrongAnswerCount = 0
            
            scoreLabel.text = "WIN: \(score)"
        }
    }
    func levelUp(action: UIAlertAction) {
        countWrongAnswerCount = 0
        countRightAnswerCount = 0
        print("leevedUPed")
        
        scoreLabel.text = "WIN: \(score)"
        
        answerText = "--------"
        imageView.image = UIImage(named: "hangman\(countWrongAnswerCount)")
        answerUILabel.text = answerText.trimmingCharacters(in: .whitespaces)
        
        
        for button in letterButtons {
            button.isHidden = false
            button.setTitleColor(UIColor.black, for: .normal)
        }
        loadLevel()
    }
    
    func replace(myString: String, _ index: Int, _ newChar: Character) -> String {
        var chars = Array(myString)     // gets an array of characters
        chars[index] = newChar
        let modifiedString = String(chars)
        return modifiedString
    }
    
    func loadLevel() {
        imageView.image = UIImage(named: "hangman\(countWrongAnswerCount)")
        if let startWordsURL = Bundle.main.url(forResource: "start", withExtension: "txt") {
            if let startWords = try? String(contentsOf: startWordsURL) {
                allWords = startWords.components(separatedBy: "\n")
                selectedWord = allWords.randomElement()!
                selectedWord = selectedWord.uppercased()
                print("selectedWord", selectedWord)
                usedLetters.removeAll(keepingCapacity: true)
            }
        }
        
        if allWords.isEmpty {
            allWords = ["silkworm"]
        }
        
        print("alphabetArray.count", alphabetArray.count)
        
        for i in 0..<letterButtons.count {
            letterButtons[i].setTitle(alphabetArray[i], for: .normal)
        }
    }
}//class ends

