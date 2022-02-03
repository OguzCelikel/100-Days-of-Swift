//
//  DetailViewController.swift
//  03-MilestoneProjects1-3
//
//  Created by Ömer Oğuz Çelikel on 4.02.2022.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet var imageView: UIImageView!
    var selectedImage: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let separators = CharacterSet(charactersIn: "@")
        let myItems = selectedImage?.components(separatedBy: separators)
        print(myItems ?? "Error")
        print(myItems?[0] ?? "Error2")
        title = "Flag of \(myItems?[0].uppercased() ?? "Error")"
               
        navigationItem.largeTitleDisplayMode = .never
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))
        
        if let imageToLoad = selectedImage {
            imageView.image  = UIImage(named: imageToLoad)
        }
    }
    
    
      override func viewWillAppear(_ animated: Bool) {
          super.viewWillAppear(animated)
          navigationController?.hidesBarsOnTap = true
      }
      
      override func viewWillDisappear(_ animated: Bool) {
          super.viewWillDisappear(animated)
          navigationController?.hidesBarsOnTap = false
      }
    
    @objc func shareTapped() {
        guard let flag = imageView.image?.jpegData(compressionQuality: 0.8) else {
            print("No image found")
            return
        }
        
        let vc = UIActivityViewController(activityItems: [flag, selectedImage as Any], applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: UIView.areAnimationsEnabled)
    }

}
