import UIKit

class Settings: UIViewController {
    
    let isiSettings = ["Notifications", "About", "Help"]
    @IBOutlet weak var settingTableView: UITableView!
    


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        settingTableView.delegate = self
        settingTableView.dataSource = self
    }

}

extension Settings: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return isiSettings.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "SettingsItem", for: indexPath)
        let item = isiSettings[indexPath.row]
        print(item, indexPath.row)
        cell.textLabel?.text = item
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
