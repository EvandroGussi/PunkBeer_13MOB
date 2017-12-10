//
//  BeerTableViewCell.swift
//  PunkBeer
//
//  Created by mac on 12/9/17.
//  Copyright © 2017 Evandro Gussi. All rights reserved.
//

import UIKit
import Kingfisher

class BeerTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var alcoholLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setupCell(name: String, alcoholContent: Float, photoURL: String) {
        self.photoImageView.kf.setImage(with: URL(string: photoURL))
        self.alcoholLabel.text = "\(alcoholContent)"
        self.nameLabel.text = name
    }
}
