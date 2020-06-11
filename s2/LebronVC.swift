////
////  LebronVC.swift
////  s2
////
////  Created by Carlos Loeza on 6/10/20.
////  Copyright © 2020 Carlos Loeza. All rights reserved.
////
//
//import UIKit
//
//class LebronVC: UIViewController {
//
////    let celebInfo = [info(activity: "Sushi 🍣   $$$"), info(activity: "Bike Trail 🚴🏼‍♀️   Free")]
//    
//    @IBOutlet weak var celebName: UILabel!
//    @IBOutlet weak var celebImage: UIImageView!
//    var celeb = persons[myIndex]
//
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        celebName.text = celeb.name
//        celebImage.image = celeb.image
//        
//        
//    }
//
//}
//
//
//// Let's us know when a cell is tapped
//extension LebronVC: UITableViewDelegate{
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print("Tapped")
//    }
//}
//
//extension LebronVC: UITableViewDataSource{
//    // Tells us how many rows to create
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return celebInfo.count
//    }
//    // Customize our cell info
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
//        
//        cell.textLabel?.text = celebInfo[indexPath.row].activity
//        return cell
//    }
//}
