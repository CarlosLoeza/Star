//
//  ActivityVC.swift
//  s2
//
//  Created by Carlos Loeza on 7/5/20.
//  Copyright © 2020 Carlos Loeza. All rights reserved.
//

import UIKit

class ActivityVC: UIViewController {
    
    
    @IBOutlet weak var activityTitle: UILabel!
    @IBOutlet weak var activityImage: UIImageView!
    @IBOutlet weak var activityAddress: UILabel!
    @IBOutlet weak var activityMenu: UITextView!
    
    var activity = unlockedCelebInfo[myIndex]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        activityTitle.text = activity
        
        updateTextView()
    }
    
    // This creates a hyperlink to open up the URL menu link
    func updateTextView(){
        let path = "https://matsuhisabeverlyhills.com"
        let text = activityMenu.text ?? ""
        let attributedString = NSAttributedString.makeHyperLink(for: path, in: text, as: "Menu")
        activityMenu.attributedText = attributedString
    }
    

}
