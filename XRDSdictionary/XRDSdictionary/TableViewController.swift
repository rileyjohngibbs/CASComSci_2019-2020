//
//  TableViewController.swift
//  XRDSdictionary
//
//  Created by Dani Lubezki on 11/5/19.
//  Copyright © 2019 Dani Lubezki. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    let vocab: [String:String] = [
        "Sin Wave":"Structure on Upper School Admin Building",
        "Allyween":"Halloween festivities in the crossroads alley",
        "ROP":"A 4 day senior rights of passage trip where the groups have intense bonding.",
        "Butterfly Garden":"A part of the campus that is sick but never used",
        "Alley":"The road the runs between the library and basketball court",
        "The beanbag room (RIP)":"The former hangout space in the Humanities Building (that smelled gross)",
        "Cadena":"The feeding grounds",
        "Roth Hall":"A larger room where we convene agaisnt our will",
        "Green Tent":"A tent that is green and contains overpriced food",
        "Humanities":"Next to the library, behind the hammock",
        "Library":"Building with many books",
        "Science Building":"A building with lots of science funding that took a while to build and is very big",
        "Reykjavik":"A Life Skills room with a unique history that no one knows",
        "David Listenberger":"A Life Skills teacher with a beard and kind attitude",
        "Rocio":"The gatekeeper of crossroads",
        "Cabaret":"Crossroads: A musical",
        "Life Skills":"Feelings class",
        "The Alley":"Common ground between all the classes. People eat and hangout here.",
        "Senior Dog Day":"Seniors bring their dogs, fun?",
        "EOE":"Enviormental Outdoor Education",
        "Alley Party":"Yearly party near the beginning of the year, with music and food.",
        "Ombuds":"2 representatives of the school, charged with looking after student life",
        "Anthony":"The Dean of Student Life",
        "Tenzing":"A meeting room that many get confused with roth hall. Next to the green tent",
        "Descartes":"A math room",
        "Archimedes":"Another math room",
        "Upper lot":"Parking lot behind Crossroads. Considered the better parking lot because the walk is shorter to campus",
        "Senior Smoke Day":"Day where seniors smoke cigars in the Alley",
        "Grade Level":"weekly grade meetings, not mandatory",
        "EMMI":"Elizabeth Mandell Music Institute - music major department at Crossroads",
        "Lower Lot":"Parking lot at the elemetary school. Students don't want to have to park here because it is far",
        "ZOCC":"Zeus's omnipotent classics consortium",
        "CAS":"Off-brand APs",
        "Hya's Class":"A class that will beat you down mercilessly but in the process make you a better writer",
        "Tech Theater":"Something that no longer exists",
        "Crossfire":"student publication",
        "D.A.D":"Dark as Day, student publication dedicated to displaying student art and creations",
        "Fit Dog":"Doggy Daycare and shop on campus that exists because the land lord won't sell to Crossroads",
        "The Schedule":"A mysterious twisting and turning block schedule that confounds many to this day"
    ]
    var vocabWords = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        vocabWords = Array(vocab.keys).sorted()
        

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
        let list = vocab.keys
        return list.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        //let list = Array(vocab.keys)
        let title = vocabWords[indexPath.row]
        cell.textLabel!.text = title

        // Configure the cell...

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

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        let vc = segue.destination as! ViewController
        // Pass the selected object to the new view controller.
        let indexPath = self.tableView.indexPathForSelectedRow
        let word = self.vocabWords[indexPath!.row]
        vc.vocabWord = word
        vc.vocabDefinition = self.vocab[word]!
    }

}
