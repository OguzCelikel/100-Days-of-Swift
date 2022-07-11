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
        
        // Dark theme
        overrideUserInterfaceStyle = .dark
        
        tableView.reloadData()
        self.navigationController!.navigationBar.barStyle = .black
        self.navigationController!.navigationBar.isTranslucent = false
        self.navigationController!.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.systemBlue]
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNewUIBarButtonItem))
        
        //self.navigationController!.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.red]
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .trash, target: self, action: #selector(deleteAllUIBarButtonItem))
        navigationItem.leftBarButtonItem?.tintColor = .red
        
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
        view.translatesAutoresizingMaskIntoConstraints = false
        cell.textLabel?.text = shoppingList[indexPath.row]
        
        return cell
    }
    @objc func deleteAllUIBarButtonItem(){
        
        let deleteAlert = UIAlertController(title: "❗️The entire list will be deleted.", message: nil, preferredStyle: UIAlertController.Style.alert)
        
        deleteAlert.addAction(UIAlertAction(title: "Yes, I'm sure", style: .default, handler: { (action: UIAlertAction!) in
            print(self.shoppingList)
            print("delete button tapped")
            self.shoppingList.removeAll()
            print(self.shoppingList)
            self.tableView.reloadData()
        }))
        
        deleteAlert.addAction(UIAlertAction(title: "Nooo wait!", style: .cancel, handler: { (action: UIAlertAction!) in
            print("Handle Cancel Logic here")
        }))
        
        present(deleteAlert, animated: true, completion: nil)
        
        
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
        
        // empty word
        if !isEmptyAnswer(word: lowerAnswer) {
            showErrorMessage(title: "Did you tab the button by mistake?", message: "Please check again :)")
            return
        }
        
        // valid word
        shoppingList.insert(lowerAnswer, at: 0)
        
        // could have just called tableView.reloadData() but then the insertion wouldn't have been animated
        let indexPath = IndexPath(row: 0, section: 0)
        tableView.insertRows(at: [indexPath], with: .automatic)
        
    }
    
    func isEmptyAnswer(word: String) -> Bool {
        if word.count < 1 {
            return false
        } else {
            return true
        }
    }
    
    func showErrorMessage(title: String, message: String) {
        let ac = UIAlertController(title: title, message: message, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default))
        present(ac, animated: true)
    }
    
}
