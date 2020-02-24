//
//  jokesViewController.swift
//  BadKeyboard
//
//  Created by Riley John Gibbs on 2/24/20.
//  Copyright © 2020 Riley John Gibbs. All rights reserved.
//

import UIKit

class JokesViewController: UIViewController {

    let baseUrl: URL? = URL(string: "https://icanhazdadjoke.com/")
    var relativeUrl: String = "/"
    
    @IBOutlet weak var jokesTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        guard let fullUrl = URL(string: relativeUrl, relativeTo: baseUrl) else {
            return
        }
        var request = URLRequest(url: fullUrl)
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data, let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] else {
                return
            }
            if let results = json["results"] as? [[String: Any]] {
                for joke in results {
                    guard let joke = joke["joke"] as? String else {
                        continue
                    }
                    self.addJokeToView(joke)
                }
            } else if let joke = json["joke"] as? String {
                self.addJokeToView(joke)
            } else {
                return
            }
        }
        task.resume()
    }
    
    func addJokeToView(_ joke: String) {
        DispatchQueue.main.async {
            guard let tv = self.jokesTextView else {
                return
            }
            if (tv.text ?? "") != "" {
                tv.text += "\n\n"
            }
            tv.text += joke
        }
    }

}
