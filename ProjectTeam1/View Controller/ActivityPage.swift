//
//  ActivityPage.swift
//  ProjectTeam1
//
//  Created by Fauzi Rizal on 26/04/19.
//  Copyright © 2019 Apple Academy. All rights reserved.
//

import UIKit

class ActivityPage: UIViewController {
    
    // variables
    var listContent: [String] = []
    var index: Int = 0
    
    
    
    // outlet
    @IBOutlet weak var isiPertanyaanTableView: UITableView!
    @IBOutlet weak var domainImage: UIImageView!
    
    
    // viewdidload
    override func viewDidLoad() {
        super.viewDidLoad()

        // delegate method buat table view
        isiPertanyaanTableView.delegate = self
        isiPertanyaanTableView.dataSource = self
        
        
    }
    
    
    // button
    @IBAction func DoneButton(_ sender: UIButton) {
        index += 1
        
        if index < 7 {
            viewWillAppear(true)
            DataPertanyaan.shared.loadData()
            listContent = DataPertanyaan.shared.babyArray[index].pertanyaan
            isiPertanyaanTableView.reloadData()
        } else {
            performSegue(withIdentifier: "doneSegue", sender: self)
        }
        
        
    }
    
    
    // view will appear
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        
        DataPertanyaan.shared.loadData()
        listContent = DataPertanyaan.shared.babyArray[index].pertanyaan
        domainImage.image = DataPertanyaan.shared.babyArray[index].gambar
        
        isiPertanyaanTableView.reloadData()
    }
    
    

}

extension ActivityPage: UITableViewDelegate, UITableViewDataSource {
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return listContent.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let item = listContent[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "activityItemCell", for: indexPath)
        
        // the text inside the cell
        cell.textLabel?.text = item
        cell.textLabel?.numberOfLines = 0
        
        // accessory
        cell.accessoryType = DataPertanyaan.shared.babyArray[index].done[indexPath.row] ? .checkmark : .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if DataPertanyaan.shared.babyArray[index].done[indexPath.row] == true {
            DataPertanyaan.shared.babyArray[index].done[indexPath.row] = false
        } else {
            DataPertanyaan.shared.babyArray[index].done[indexPath.row] = true
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        tableView.reloadData()
    }
    
}
