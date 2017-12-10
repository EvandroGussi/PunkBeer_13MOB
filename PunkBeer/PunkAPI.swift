//
//  PunkAPI.swift
//  PunkBeer
//
//  Created by mac on 12/9/17.
//  Copyright © 2017 Evandro Gussi. All rights reserved.
//

import UIKit

class PunkAPI {
    static func getBeers(page: Int = 1,
                  results: Int = 20,
                  onSuccess: @escaping ([Beer]) -> Void,
                  onFailure: @escaping (Error) -> Void) {
        
        let url = URL(string: "https://api.punkapi.com/v2/beers?page=1&per_page=20")!
        
        let response = URLSession.shared.dataTask(with: url) { (data, response, error) in
           
            if let result = data {
                do {
                    var listBeers = [Beer]()
                 
                    let json = try JSONSerialization.jsonObject(with: result, options: .allowFragments) as! [[String:Any]]
                    for beersJson in json {
                        let beerData = Beer.init(id: beersJson["id"] as? Int ?? 0,
                                             name: beersJson["name"] as? String ?? "",
                                             tagline: beersJson["tagline"] as? String ?? "",
                                             description: beersJson["description"] as? String ?? "",
                                             imageURL: beersJson["image_url"] as? String ?? "",
                                             abv: beersJson["abv"] as? Float ?? 0.0,
                                             ibu: beersJson["ibu"] as? Float ?? 0.0)
                        
                        listBeers.append(beerData)
                    }
                    
                    onSuccess(listBeers)
                    
                } catch let e {
                    print("Error while parsing JSON: \(e.localizedDescription)")
                }
                
            }
        }
        response.resume()
    }
    
}
