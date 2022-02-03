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
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }
    


}
