//
//  ViewController.swift
//  Project5
//
//  Created by Ömer Oğuz Çelikel on 6.02.2022.
//

import UIKit

class ViewController: UITableViewController {
    var allWords = [String]()
    var usedWords = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(promptForAnswer))
        
        // takes as its parameters the name of the file and its path extension
        if let startWordURL = Bundle.main.url(forResource: "start", withExtension: "txt"){
            //try? means "call this code, and if it throws an error just send me back nil instead."
            if let startWords = try? String(contentsOf: startWordURL){
                allWords = startWords.components(separatedBy: "\n")
            }
        }
        
        if allWords.isEmpty{
            allWords = ["silkworm"]
        }
        
        startGame()
    }
    /*
     This will be called every time we want to generate a new word for the player to work with, and it will use the randomElement() method of Swift’s arrays to choose one random item from all the strings.
     */
    func startGame() {
        title = allWords.randomElement()
        usedWords.removeAll(keepingCapacity: true)
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return usedWords.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Word", for: indexPath)
        cell.textLabel?.text = usedWords[indexPath.row]
        return cell
    }


}

