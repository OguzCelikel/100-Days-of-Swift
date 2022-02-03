//
//  ViewController.swift
//  02-Project2
//
//  Created by Ömer Oğuz Çelikel on 2.02.2022.
//

import UIKit

class MySweetViewController: UIViewController {

    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    // Challenge 2
    var questionAsked = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        /*
        countries.append("estonia")
        countries.append("france")
        countries.append("germany")
        countries.append("ireland")
        countries.append("italy")
        countries.append("monaco")
        countries.append("nigeria")
        countries.append("poland")
        countries.append("russia")
        countries.append("spain")
        countries.append("uk")
        countries.append("us")
         */
        countries += ["estonia", "france", "germany",
                      "ireland", "italy", "monaco",
                      "nigeria", "poland", "russia",
                      "spain", "uk", "us"]

        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor(red: 1.0, green: 0.6, blue: 0.2, alpha: 1.0).cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        
        askQuestion()
        
    }
    //Buttons have a setImage() method that lets us control what picture is shown inside and when.
    //The next three use UIImage(named:) and read from an array by position
    func askQuestion(action: UIAlertAction! = nil){
        // That will automatically randomize the order of the countries in the array
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        /*
         for: .normal The setImage() method takes a second parameter that describes
         which state of the button should be changed. We're specifying .normal,
         which means "the standard state of the button."
         */
        questionAsked += 1
        
        // Challenge 1,2
        title = "\(countries[correctAnswer].uppercased()) Score: \(score)  Q: \(questionAsked)/10"
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        var title: String
        if sender.tag == correctAnswer{
            title = "Correct"
            score += 1
        }else{
            // Challenge 3
            title = "Wrong! That’s the flag of \(countries[sender.tag].uppercased())"
            score -= 1
        }
        
        let ac = UIAlertController(title: title, message: "Your Score is \(score)", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Continue", style: .default , handler: askQuestion))
        present(ac, animated: true)
        /*
         We must use askQuestion and not askQuestion(). If you use the former,
         it means "here's the name of the method to run,"
         but if you use the latter it means "run the askQuestion() method now,
         and it will tell you the name of the method to run."
         */
        

        print("questionAsked : \(questionAsked)")
        if questionAsked == 10{
            ac.title = "Done!"
            ac.message = "Final Score :\(score)"
            ac.addAction(UIAlertAction(title: "Close", style: .default, handler: askQuestion))
            

        }
        
        
    }
    
    


}

