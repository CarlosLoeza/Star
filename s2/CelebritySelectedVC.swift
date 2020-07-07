//
//  CelebritySelectedVC.swift
//  s2
//
//  Created by Carlos Loeza on 6/10/20.
//  Copyright © 2020 Carlos Loeza. All rights reserved.
//

import UIKit

// We need to create a database to bring down info
// For now I made it global var
var celebInfo = ["Sushi 🍣   $$$", "Nightclub 🍸  $$$", "Hiking Trail 🏞  Free"]
let unlockedCelebInfo = ["Matsushisa", "Nice Guy", "Runyon Canyon"]

class CelebritySelectedVC: UIViewController {
    
    @IBOutlet weak var celebOptions: UITableView!
    @IBOutlet weak var celebName: UILabel!
    @IBOutlet weak var celebImage: UIImageView!

    
    var celeb = persons[myIndex]
    

    override func viewDidLoad() {
        super.viewDidLoad()

        celebName.text = celeb.name
        celebImage.image = celeb.image
        
        celebOptions.delegate = self
        celebOptions.dataSource = self
        
        celebOptions.rowHeight = 70
    }
    
    
    // This function will unlock activities once user clicks buy
    func unlock(action: UIAlertAction){
        // insert new list and reload tableView
        celebInfo = unlockedCelebInfo
        celebOptions.reloadData()
    }
    
    
    // if buyButton is clicked show an alert box that asks the user if they want to unlock celebrity
    // alert box is that gray/white notification pop-up box you get when asked do you want to receive notification for "this" app
    @IBAction func buyButton(_ sender: Any) {
        // alert box will have the celeb name as title and message will ask if they want to unlock celebrity
        let alertController = UIAlertController(title: "\(celebName.text!)", message:
            "Unlock activities for $.99", preferredStyle: .alert)
        // add buy button to alert box
        alertController.addAction(UIAlertAction(title: "Buy", style: .default, handler: unlock))
        // Cancel button to alert box
        alertController.addAction(UIAlertAction(title: "Cancel", style: .default))

        self.present(alertController, animated: true, completion: nil)
    }

}

    


// Let's us know when a cell is tapped
extension CelebritySelectedVC: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // unselects the tab bar clicked
        self.celebOptions.deselectRow(at: indexPath, animated: true)
        print("Tapped")
    }
}

extension CelebritySelectedVC: UITableViewDataSource{
    // Tells us how many rows to create
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return celebInfo.count
    }
    // Customize our cell info
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = celebInfo[indexPath.row]
        return cell
    }
    
    // This calls the passes the image and celeb name variables to the indepth viewController of celeb
    func tv(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        self.celebOptions.deselectRow(at: indexPath, animated: true)
        // this tells us which cell the user clicked
        myIndex = indexPath.row
        
        performSegue(withIdentifier: "activitySegue", sender: self)
 
        }
}
