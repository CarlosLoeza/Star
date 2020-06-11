//
//  PersonTableViewCell.swift
//  s2
//
//  Created by Carlos Loeza on 6/7/20.
//  Copyright © 2020 Carlos Loeza. All rights reserved.
//

import UIKit

class PersonTableViewCell: UITableViewCell {

    
    
    @IBOutlet weak var personImageView: UIImageView!
    
    @IBOutlet weak var personNameLabel: UILabel!
    
    @IBOutlet weak var personStatusImageView: UIImageView!
    
    
    func update(with person: Person){
        personImageView.image = person.image
        personNameLabel.text = person.name
        personStatusImageView.image = person.imageLock
    }
    
    
}
