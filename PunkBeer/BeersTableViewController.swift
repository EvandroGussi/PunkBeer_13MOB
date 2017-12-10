//
//  BeersTableViewController.swift
//  PunkBeer
//
//  Created by mac on 12/9/17.
//  Copyright © 2017 Evandro Gussi. All rights reserved.
//

import UIKit

class BeersTableViewController: UITableViewController {
    
    var beerList = [Beer]();

    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadInfo()
    }
    
    func loadInfo() {
        PunkAPI.getBeers(onSuccess: { (result) in
            
            self.beerList = result
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            
        }) { (error) in
            print("Error while getting beers: \(error.localizedDescription)")
        }
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return beerList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "beerCell", for: indexPath) as! BeerTableViewCell
        
        let beers = beerList[indexPath.row]
        
        cell.setupCell(name: beers.name,
                       alcoholContent: beers.abv,
                       photoURL: beers.imageURL)
        
        return cell
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    // MARK: Table view delegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showDetail", sender: beerList[indexPath.row])
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let beer = sender as? Beer {
                let detailBeer = segue.destination as! BeerDetailViewController
                detailBeer.beer = beer
            }
        }
    }
    
}
