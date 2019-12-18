//
//  ViewController2.swift
//  iTunesAPI
//
//  Created by Dani Lubezki on 12/18/19.
//  Copyright © 2019 Dani Lubezki. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {
    @IBOutlet weak var buttonR: UILabel!
    @IBOutlet weak var buttonF: UILabel!
    @IBOutlet weak var buttonI: UILabel!
    @IBOutlet weak var buttonL: UILabel!
    
    var album = ""

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if album == "Blond" {
            let url: URL = URL(string: "https://itunes.apple.com/search?term=blond&entity=album")!
            let responseData: Data? = try? Data(contentsOf: url)
            if let responseData = responseData {
                let json: Any? = try? JSONSerialization.jsonObject(with: responseData, options: [])
                if let json = json {
                    let dictionary: [String: Any]? = json as? [String: Any]
                    if let dictionary = dictionary, let results = dictionary["results"] as? [[String: Any]] {
                        var album: [String: Any]? = nil
                        for result in results {
                            if result["collectionCensoredName"] as? String == "Blonde" {
                                album = result
                                break
                            }
                        }
                        if let album = album,
                            let collectionName: String = album["collectionName"] as? String,
                            let artistName: String = album["artistName"] as? String,
                            let primaryGenreName: String = album["primaryGenreName"] as? String {
                            buttonF.text = "ALBUM NAME: \(collectionName) \n\nARTIST: \(artistName) \n\nGENRE: \(primaryGenreName)"
                        }
                    }
                }
                
            }
        }
            
        else if album == "Anti" {
            let url: URL = URL(string: "https://itunes.apple.com/search?term=anti+rihanna&entity=album")!
            let responseData: Data? = try? Data(contentsOf: url)
            if let responseData = responseData {
                let json: Any? = try? JSONSerialization.jsonObject(with: responseData, options: [])
                if let json = json {
                    let dictionary: [String: Any]? = json as? [String: Any]
                    if let dictionary = dictionary, let results = dictionary["results"] as? [[String: Any]] {
                        var album: [String: Any]? = nil
                        for result in results {
                            if result["collectionCensoredName"] as? String == "ANTI" {
                                album = result
                                break
                            }
                        }
                        if let album = album,
                            let collectionName: String = album["collectionName"] as? String,
                            let artistName: String = album["artistName"] as? String,
                            let primaryGenreName: String = album["primaryGenreName"] as? String {
                            buttonR.text = "ALBUM NAME: \(collectionName) \n\nARTIST: \(artistName) \n\nGENRE: \(primaryGenreName)"
                        }
                    }
                    }
                    
                }
            }
           
        
        else if album == "Igor" {
            let url: URL = URL(string: "https://itunes.apple.com/search?term=igor&entity=album")!
            let responseData: Data? = try? Data(contentsOf: url)
            if let responseData = responseData {
                let json: Any? = try? JSONSerialization.jsonObject(with: responseData, options: [])
                if let json = json {
                    let dictionary: [String: Any]? = json as? [String: Any]
                    if let dictionary = dictionary, let results = dictionary["results"] as? [[String: Any]] {
                        var album: [String: Any]? = nil
                        for result in results {
                            if result["collectionCensoredName"] as? String == "IGOR" {
                                album = result
                                break
                            }
                        }
                        if let album = album,
                            let collectionName: String = album["collectionName"] as? String,
                            let artistName: String = album["artistName"] as? String,
                            let primaryGenreName: String = album["primaryGenreName"] as? String{
                            buttonI.text = "ALBUM NAME: \(collectionName) \n\nARTIST: \(artistName) \n\nGENRE: \(primaryGenreName)"
                        }
                    }
                }
                
            }
        }
        else if album == "River" {
            let url: URL = URL(string: "https://itunes.apple.com/search?term=cominghome&entity=album")!
            let responseData: Data? = try? Data(contentsOf: url)
            if let responseData = responseData {
                let json: Any? = try? JSONSerialization.jsonObject(with: responseData, options: [])
                if let json = json {
                    let dictionary: [String: Any]? = json as? [String: Any]
                    if let dictionary = dictionary, let results = dictionary["results"] as? [[String: Any]] {
                        var album: [String: Any]? = nil
                        for result in results {
                            if result["collectionCensoredName"] as? String == "Coming Home" {
                                album = result
                                break
                            }
                        }
                        if let album = album,
                            let collectionName: String = album["collectionName"] as? String,
                            let artistName: String = album["artistName"] as? String,
                            let primaryGenreName: String = album["primaryGenreName"] as? String {
                            buttonL.text = "ALBUM NAME: \(collectionName) \n\nARTIST: \(artistName) \n\nGENRE: \(primaryGenreName)"
                        }
                    }
                }
                
            }
        }

}
}

