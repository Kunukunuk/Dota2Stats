//
//  Hero.swift
//  Dota2Stats
//
//  Created by Kun Huang on 11/12/18.
//  Copyright © 2018 Kun Huang. All rights reserved.
//

import Foundation
import UIKit

class Hero {
    
    var heroID: Int?
    var heroName: String?
    var heroNotReadableName: String?
    var pathURL: URL?
    
    init(heroInfo: Any) {
        let heroDict = heroInfo as! [String: Any]
        
        heroID = heroDict["id"] as? Int
        heroName = heroDict["localized_name"] as? String
        heroNotReadableName = heroDict["name"] as? String
        
        
        let heroNameArray = heroNotReadableName?.components(separatedBy: "hero_")
        pathURL = URL(string: "http://cdn.dota2.com/apps/dota2/images/heroes/\(heroNameArray![1])_full.png")
        
    }
    
}
