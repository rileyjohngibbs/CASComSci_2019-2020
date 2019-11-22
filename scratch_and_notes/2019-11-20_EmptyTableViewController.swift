/*
In each empty function body, write in plain English what that function is supposed to do for a table view application like the ones we've been working on in class.
*/

class EmptyTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        


    }
    
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        
        
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)



        return cell
    }

    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
    
    
    }
}
