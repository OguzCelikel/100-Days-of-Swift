//
//  shoppingListTableViewController.swift
//  Milestone-Projects4-6
//
//  Created by Ömer Oğuz Çelikel on 11.07.2022.
//

import UIKit

class shoppingListTableViewController: UITableViewController {
    
    // user's shopping list array
    var shoppingList = [String]()
    //var shoppingList = ["apple", "banana", "tomato", "RedBull"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "🛒 Shopping List"
        tableView.reloadData()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNewUIBarButtonItem))
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return shoppingList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Product", for: indexPath)

        cell.textLabel?.text = shoppingList[indexPath.row]

        return cell
    }

    @objc func addNewUIBarButtonItem(){
        let ac = UIAlertController(title: "Enter a new product", message: nil, preferredStyle: .alert)
        ac.addTextField()
        
        let submitAction = UIAlertAction(title: "Submit", style: .default) {
            [weak self, weak ac] _ in
            guard let answer = ac?.textFields?[0].text else { return }
            self?.submit(answer)
        }
        ac.addAction(submitAction)
        present(ac, animated: true)
    }
    
    func submit(_ answer: String) {
        let lowerAnswer = answer.lowercased()
        
        if isEmptyAnswer(word: lowerAnswer) {
            
            
        }
        
    }
    
    func isEmptyAnswer(word: String) -> Bool {
        return !shoppingList.contains(word)
    }

}
