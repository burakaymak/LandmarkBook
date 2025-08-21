//
//  DetailsVC.swift
//  LandmarkBook
//
//  Created by Burak Kaymak on 21.08.2025.
//

import UIKit

class DetailsVC: UIViewController {
    
    
    @IBOutlet weak var landmarkName: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    var selectedlandmarkName = ""
    var selectedlandmarkImage = UIImage()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        landmarkName.text = selectedlandmarkName
        imageView.image = selectedlandmarkImage

        
    }
    

    

}
