//
//  ViewController.swift
//  LandmarkBook
//
//  Created by Burak Kaymak on 21.08.2025.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var landmarkNames = [String]()
    var landmarkImages = [UIImage]()
    
    var chosenlandmarkName = ""
    var chosenlandmarkImage = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        
        landmarkNames.append("Colosseum")
        landmarkNames.append("Great Wall")
        landmarkNames.append("Kremlin")
        landmarkNames.append("Stonehenge")
        landmarkNames.append("Taj Mahal")
        
        
        
        // ! kesinlikle doğru yazdığımı gösteriyor. aksi takdirde app çöker.
        landmarkImages.append(UIImage(named: "colosseum")!)
        landmarkImages.append(UIImage(named: "greatwall")!)
        landmarkImages.append(UIImage(named: "kremlin")!)
        landmarkImages.append(UIImage(named: "stonehenge")!)
        landmarkImages.append(UIImage(named: "tajmahal")!)
        
        
        
        
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return landmarkNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        // cell.textLabel?.text = "Test" // kullanımdan kalkmak üzere olduğu için başka yola gidiyorum.
        var content = cell.defaultContentConfiguration()
        content.text = landmarkNames[indexPath.row]
        cell.contentConfiguration = content
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chosenlandmarkName = landmarkNames[indexPath.row]
        chosenlandmarkImage = landmarkImages[indexPath.row]
        performSegue(withIdentifier: "toDetailsVC", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailsVC" 
        {
            let destinationVc = segue.destination as! DetailsVC
            destinationVc.selectedlandmarkName = chosenlandmarkName
            destinationVc.selectedlandmarkImage = chosenlandmarkImage
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete
        {
            self.landmarkNames.remove(at: indexPath.row)
            self.landmarkImages.remove(at: indexPath.row)
            tableView.deleteRows(at:[indexPath], with: UITableView.RowAnimation.fade)
            
        }
    }


}

