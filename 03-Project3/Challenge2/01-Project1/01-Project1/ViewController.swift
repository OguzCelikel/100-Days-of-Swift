//
//  ViewController.swift
//  01-Project1
//
//  Created by Ömer Oğuz Çelikel on 30.01.2022.
//

import UIKit
//UIViewController changed to UITableViewController
//This doesn’t take much to do, but you’re going to meet a new part of Xcode called Interface Builder.
class ViewController: UITableViewController {
    
    var pictures = [String]()

    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        title = "Storm Viewer"
        //large title
        navigationController?.navigationBar.prefersLargeTitles = true
        
        // project 3 challenge 2
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))

        
        //This is a data type that lets us work with the filesystem, and in our case we'll be using it to look for files.
        let fm = FileManager.default
        
        //this line says, "tell me where I can find all those images I added to my app."
        let path = Bundle.main.resourcePath!
        
        //this line declares a third constant called items that is set to the contents of the directory at a path
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        /*
         fine to use Bundle.main.resourcePath! and try!,
         because if this code fails it means our app can't read its own data so something must be seriously wrong.
         
         */

        for item in items {
            if item.hasPrefix("nssl") {
                // this is a picture to load!
                pictures.append(item)
            }
        }
        
        //challenge 2
        pictures.sort()
        print(pictures)
        
    }//viewDidLoadEnds

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        cell.textLabel?.text = pictures[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // in case of some of them became nill 
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController{
            vc.selectedImage = pictures[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
            
            // challenge 3
            vc.position = (position: indexPath.row + 1, total: pictures.count) // +1 starts from 1
        }
    }
    
    // project 3 challenge 2
    @objc func shareTapped() {
        var items: [Any] = ["This app is great, you should try it!"]
        if let url = URL(string: "https://www.hackingwithswift.com/100/22") {
            items.append(url)
        }
        
        let vc = UIActivityViewController(activityItems: items, applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true)
    }
}

