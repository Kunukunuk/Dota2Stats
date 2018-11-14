//
//  APIManager.swift
//  Dota2Stats
//
//  Created by Kun Huang on 11/12/18.
//  Copyright © 2018 Kun Huang. All rights reserved.
//  https://wiki.teamfortress.com/wiki/WebAPI
//  to get more api calls

import Foundation

class APIManager{
    
    init() {
        
    }
    
    func getData(completion: @escaping ([Hero]?, Error?) -> ()) {
        var heroArray: [Hero] = []
        let url = URL(string: "https://api.steampowered.com/IEconDOTA2_570/GetHeroes/v1/?key=yourkey&language=en_us")!
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let dataJson = data else {
                print(error?.localizedDescription ?? "just error")
                completion(nil, error)
                return
            }
            let dataDictionary = try! JSONSerialization.jsonObject(with: dataJson, options: []) as! [String: Any]
            let results = dataDictionary["result"] as! [String: Any]
            let heroes = results["heroes"] as! NSArray
            
            for hero in heroes {
                let eachHero = Hero.init(heroInfo: hero)
                heroArray.append(eachHero)
            }
            completion(heroArray, nil)
            
        }
        task.resume()
    }
    
    func getHeroImage(with heroName: String) {
        let url = URL(string: "https://cdn.dota2.com/apps/dota2/images/heroes/\(heroName)_full.png")
        let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
            guard let dataPic = data else {
                print(error?.localizedDescription ?? "error getting picture")
                return
            }
            
            print(dataPic)
            
        }
        task.resume()
    }
}
