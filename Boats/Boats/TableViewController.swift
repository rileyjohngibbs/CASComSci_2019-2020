//
//  TableViewController.swift
//  Boats
//
//  Created by Dani Lubezki on 11/8/19.
//  Copyright © 2019 Dani Lubezki. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    let boats: [Boat] = [
    Boat(n:"Kayak", dp:"Man Power",c:"White", s:"Small"),
    Boat(n:"PHEONIX 2", dp:"All the power",c:"Black & White", s:"Massive"),
    Boat(n:"Pirate Ship", dp:"200",c:"Brown", s:"Pretty big but not massive"),
    Boat(n:"Raft", dp:"Half a dolphin",c:"Red", s:"Petite"),
    Boat(n:"S.S. Tipton", dp:"3 Woodies",c:"White", s:"Big enough for Zack & Cody"),
    Boat(n:"Dinghy", dp:"Negative",c:"Burgundy", s:"Teeny Weeny"),
            ]

    @IBOutlet var boatList: UITableView!
    
    var vocabWords = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        let list = boats
        return list.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        //let list = Array(vocab.keys)
        cell.textLabel?.text = boats[indexPath.row].name
        
        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        let vc = segue.destination as! ViewController
        let boatIndex = boatList.indexPathForSelectedRow!
        vc.boat = boats[boatIndex.row]
        // Pass the selected object to the new view controller.
       
    }
}

