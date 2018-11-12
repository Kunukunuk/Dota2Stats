//
//  MainViewController.swift
//  Dota2Stats
//
//  Created by Kun Huang on 11/11/18.
//  Copyright © 2018 Kun Huang. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        getData()
    }
    
    func getData() {
        //https://wiki.teamfortress.com/wiki/WebAPI
        //to get more api calls
        let url = URL(string: "https://api.steampowered.com/IEconDOTA2_570/GetHeroes/v1/?key=&language=en_us")!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 5)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { (data, response, error) in
            // This will run when the network request returns
            if let data = data {
                let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: .allowFragments) as! [String: Any]
                print(dataDictionary)
               
            } else {
                print(error?.localizedDescription ?? "just error")
            }
        }
        task.resume()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
