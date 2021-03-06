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
    
    let apiKey = "yourkey"
    
    init() {
        
    }
    
    func getData(completion: @escaping ([Hero]?, Error?) -> ()) {
        var heroArray: [Hero] = []
        let url = URL(string: "https://api.steampowered.com/IEconDOTA2_570/GetHeroes/v1/?key=\(apiKey)&language=en_us")!
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
    
    func getLiveGames() {
        let urlGame = URL(string: "https://api.steampowered.com/IDOTA2Match_570/GetLiveLeagueGames/v1/?key=\(apiKey)")!
        let task = URLSession.shared.dataTask(with: urlGame) { (data, response, error) in
            guard let dataJson = data else {
                print(error?.localizedDescription ?? "just error")
                //completion(nil, error)
                return
            }
            let dataDictionary = try! JSONSerialization.jsonObject(with: dataJson, options: []) as! [String: Any]
            let results = dataDictionary["result"] as! [String: Any]
            let games = results["games"] as! NSArray
            for game in games {
                let gameDict = game as! [String: Any]
                print(gameDict)
            }
        }
        task.resume()
    }
    
}
