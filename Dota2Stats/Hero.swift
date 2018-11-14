//
//  Hero.swift
//  Dota2Stats
//
//  Created by Kun Huang on 11/12/18.
//  Copyright © 2018 Kun Huang. All rights reserved.
//

import Foundation

class Hero {
    
    var heroID: Int?
    var heroName: String?
    var heroNotReadableName: String?
    
    init(heroInfo: Any) {
        let heroDict = heroInfo as! [String: Any]
        
        heroID = heroDict["id"] as? Int
        heroName = heroDict["localized_name"] as? String
        heroNotReadableName = heroDict["name"] as? String
        
        let heroNameArray = heroNotReadableName?.components(separatedBy: "hero_")
        
        APIManager().getHeroImage(with: heroNameArray![1])
        
    }
    
    /*class func movies(dictionaries: NSArray) -> [Hero] {
        var movies: [Hero] = []
        for dictionary in dictionaries {
            let movie = Hero(dictionary: dictionary)
            movies.append(movie)
        }
        
        return movies
    }*/
}
