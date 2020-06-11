//
//  CelebritySelectedVC.swift
//  s2
//
//  Created by Carlos Loeza on 6/10/20.
//  Copyright © 2020 Carlos Loeza. All rights reserved.
//

import UIKit

class CelebritySelectedVC: UIViewController {
    
    
    let celebInfo = ["Sushi 🍣   $$$", "Bike Trail 🚴🏼‍♀️   Free", "Bowling 🎳   $$"]
    
    
    @IBOutlet weak var celebOptions: UITableView!
    
    //
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
}


// Let's us know when a cell is tapped
extension CelebritySelectedVC: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
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
}


//// Build the struct containing the info of our person
//struct info {
//    let activity: String
//
//}
