//
//  DetailViewController.swift
//  01-Project1
//
//  Created by Ömer Oğuz Çelikel on 31.01.2022.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet var imageView: UIImageView!
    
    var selectedImage: String?
    
    // challenge 3
    var position: (position: Int, total: Int)?
    
    
    //print(pictures)
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        if let imageToLoad = selectedImage{
            imageView.image = UIImage(named: imageToLoad)
        }
        
        // challenge 3
        if let position = position {
            title = "Picture \(position.position) of \(position.total)"
        }else{
            print("there is no position")
        }
        //title = selectedImage
        navigationItem.largeTitleDisplayMode = .never
        
        /*
         navigationItem. This navigation item is used by the navigation bar
         so that it can show relevant information.
         In this case, we're setting the right bar button item,
         which is a button that appears on the right of the navigation bar when this view controller is visible.
         */
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action,
                                                            target: self,
                                                            action: #selector(shareTapped))
        
        /*
         UIBarButtonItem data type, setting it up with three parameters: a system item, a target, and an action. The system item we specify is .action, but you can type . to have code completion tell you the many other options available. The .action system item displays an arrow coming out of a box, signaling the user can do something when it's tapped.

        The target and action parameters go hand in hand, because combined they tell the UIBarButtonItem what method should be called. The action parameter is saying "when you're tapped, call the shareTapped() method," and the target parameter tells the button that the method belongs to the current view controller – self.

        The part in #selector bears explaining a bit more, because it's new and unusual syntax. What it does is tell the Swift compiler that a method called "shareTapped" will exist, and should be triggered when the button is tapped.
         */
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }
    
    /*
     marked with @objc because this method will get called by the underlying Objective-C operating system (the UIBarButtonItem) so we need to mark it as being available to Objective-C code. When you call a method using #selector you’ll always need to use @objc too.
     */
    @objc func shareTapped(){

        guard let image = imageView.image?.jpegData(compressionQuality: 0.8)
        else{
            print("No image found")
            return
        }
        
        //Challange 1
        var shareable: [Any] = [image]
        if let imageText = selectedImage{
            shareable.append(imageText)
            }
        
        let vc = UIActivityViewController(activityItems: [image], applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true)
        
    }

}
