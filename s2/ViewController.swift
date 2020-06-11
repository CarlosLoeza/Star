//
//  ViewController.swift
//  s2
//
//  Created by Carlos Loeza on 6/7/20.
//  Copyright © 2020 Carlos Loeza. All rights reserved.
//

import UIKit


// Global var
// Array of people on the list
let persons = [Person(name: "Drew Barrymore", image: #imageLiteral(resourceName: "Drew"), imageLock: #imageLiteral(resourceName: "uiLock")), Person(name: "Jake Paul", image: #imageLiteral(resourceName: "jp"), imageLock: #imageLiteral(resourceName: "uiUnlock")),Person(name: "Kylie Jenner", image: #imageLiteral(resourceName: "Kylie"), imageLock: #imageLiteral(resourceName: "uiLock") ),Person(name: "Lebron James", image: #imageLiteral(resourceName: "lbj."), imageLock: #imageLiteral(resourceName: "uiUnlock") ), Person(name: "Oprah Winfrey", image: #imageLiteral(resourceName: "Oprah"), imageLock: #imageLiteral(resourceName: "uiLock")),Person(name: "Steph Curry", image: #imageLiteral(resourceName: "curry"), imageLock: #imageLiteral(resourceName: "uiUnlock")), Person(name: "Ryan Gosling", image: #imageLiteral(resourceName: "ryang"), imageLock: #imageLiteral(resourceName: "uiUnlock"))]
// this will tell us what person the user selected on our list
var myIndex = 0



class ViewController: UIViewController, UITabBarDelegate, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
       // tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.dataSource = self
        // User clicks on one of the celebrities

    }
}

// Extension to build our tableview and cells
extension ViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let person = persons[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "personCell", for: indexPath) as! PersonTableViewCell
        
        cell.update(with: person )
        return cell
    }
    
    // # of rows based on the people on the list
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return persons.count
    }
    
    // This calls the passes the image and celeb name variables to the indepth viewController of celeb
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        self.tableView.deselectRow(at: indexPath, animated: true)
        // this tells us which cell the user clicked
        myIndex = indexPath.row
        
        performSegue(withIdentifier: "segue", sender: self)
        
//        if(myIndex == 1){
//            print("1")
//            // this performs the transition from cell to new view controller
//            performSegue(withIdentifier: "segue", sender: self)
//        } else if (myIndex == 2){
//            print("2")
//            // this performs the transition from cell to new view controller
//            performSegue(withIdentifier: "segue2", sender: self)
//        }
        
        
    }
}

// Build the struct containing the info of our person
struct Person {
    let name: String
    let image: UIImage
    let imageLock: UIImage
}
