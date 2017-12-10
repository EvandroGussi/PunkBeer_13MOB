//
//  BeerDetailViewController.swift
//  PunkBeer
//
//  Created by mac on 12/9/17.
//  Copyright © 2017 Evandro Gussi. All rights reserved.
//

import UIKit

class BeerDetailViewController: UIViewController {
    
    var beer: Beer?

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var sloganLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var alcoholLabel: UILabel!
    @IBOutlet weak var bitternessLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let beer = self.beer else {
            return
        }
        
        nameLabel.text = beer.name
        sloganLabel.text = beer.tagline
        descriptionLabel.text = beer.description
        alcoholLabel.text = "\(beer.abv)"
        bitternessLabel.text = "\(beer.ibu)"
        
        photoImageView.kf.setImage(with: URL(string: beer.imageURL))
        
    }

}
