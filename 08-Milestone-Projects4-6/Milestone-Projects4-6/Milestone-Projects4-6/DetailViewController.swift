//
//  DetailViewController.swift
//  Milestone-Projects4-6
//
//  Created by Ömer Oğuz Çelikel on 11.07.2022.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet var detailLabel: UILabel!
    
    @IBOutlet var userAnswerUILabel: UILabel!
    
    @IBOutlet var detailTextField: UITextField!
    
    var selectedProduct: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailLabel.textColor = UIColor.yellow
        userAnswerUILabel.textColor = UIColor.yellow
        overrideUserInterfaceStyle = .dark
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func enterButton(_ sender: Any) {
        print("enter button clicked ")
    }
    
}
