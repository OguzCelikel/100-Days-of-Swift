//
//  ViewController.swift
//  Milestone-Projects7-9
//
//  Created by Ömer Oğuz Çelikel on 13.07.2022.
//

import UIKit

class ViewController: UIViewController {
    
    var answerText = "_ _ _ _ _ _ _ _"
    var allWords = [String]()
    var usedLetters = [String]()
    var answerUILabel: UILabel!
    var currentAnswer: UITextField!
    var wrongAnswers = [Int]()
    var scoreLabel: UILabel!
    let alphabetArray =  ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"];
    var letterButtons = [UIButton]()
    
    var score = 0 {
        // when score is changed
        didSet {
            //scoreLabel.text = "Score: \(score)"
        }
    }
    
    
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
        
        answerUILabel = UILabel()
        answerUILabel.translatesAutoresizingMaskIntoConstraints = false
        answerUILabel.font = UIFont.systemFont(ofSize: 34)
        answerUILabel.textAlignment = .center
        answerUILabel.text = answerText
        answerUILabel.font = UIFont(name: "MarkerFelt-Thin", size: 40)
        //text.font = UIFont(name: "MarkerFelt-Thin", size: 30)
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
            
            answerUILabel.centerXAnchor.constraint(equalTo: view.layoutMarginsGuide.centerXAnchor),
            answerUILabel.centerYAnchor.constraint(equalTo: view.layoutMarginsGuide.centerYAnchor),
            answerUILabel.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor, multiplier: 0.7),
            
            buttonsView.topAnchor.constraint(equalTo: answerUILabel.bottomAnchor, constant: 50),
            //buttonsView.centerXAnchor.constraint(equalTo: view.layoutMarginsGuide.centerXAnchor),
            //buttonsView.centerYAnchor.constraint(equalTo: view.layoutMarginsGuide.centerYAnchor)
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
        
        //answerUILabel.backgroundColor = .gray
        //buttonsView.backgroundColor = .brown
    } // loadview
    
    @objc func letterTapped(_ sender: UIButton) {
        
        guard let buttonTitle = sender.titleLabel?.text else { return }
        print("harf Tiklandi, HARF = ", buttonTitle)
        //answerUILabel.text = " _ A _ _ _ _ _ _ "
        //currentAnswer.text = currentAnswer.text?.appending(buttonTitle)
        
        sender.isHidden = true
    }
    
    
    func loadLevel() {
        //var solutionsString = ""
        //var letterBits = [String]()
        //var selectedWord = [String]()
        
        if let startWordsURL = Bundle.main.url(forResource: "start", withExtension: "txt") {
            if let startWords = try? String(contentsOf: startWordsURL) {
                allWords = startWords.components(separatedBy: "\n")
                let selectedWord = allWords.randomElement()
                print("selectedWord", selectedWord! as Any)
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

