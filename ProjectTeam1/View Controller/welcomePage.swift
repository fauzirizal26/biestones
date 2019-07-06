//
//  welcomePage.swift
//  ProjectTeam1
//
//  Created by Marilyn Martha Yusnita Devi Parhusip on 26/04/19.
//  Copyright © 2019 Apple Academy. All rights reserved.
//

import UIKit

class welcomePage: UIViewController, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return photos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DataAnakViewCell", for: indexPath) as! DataAnakTableViewCell
        
        cell.imgAnak.image = photos[indexPath.row]
        cell.lblAnak.text = names[indexPath.row]
        
        return cell
    }
    
    
    @IBOutlet weak var haloNamaLabel: UILabel!
    @IBOutlet weak var anakDanFotoTableView: UITableView!
    @IBOutlet var tapGesture: UITapGestureRecognizer!
    @IBOutlet weak var tambahAnakButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("view did load: " + namaAnak)
        
        haloNamaLabel.text = "Halo \(nama)"
        //umurLabel.text = "\(umurAnak!) bulan"
        
        tapGesture = UITapGestureRecognizer(target: self, action: #selector(welcomePage.labelTapped(_:)))
        tapGesture.numberOfTapsRequired = 1
        tapGesture.numberOfTouchesRequired = 1
        anakDanFotoTableView.addGestureRecognizer(tapGesture)
        
    }
    
    @IBAction func tambahAnakButtonPressed(_ sender: Any) {
        
        
        
    }
    @objc func labelTapped(_ sender: UITapGestureRecognizer) {
        
        performSegue(withIdentifier: "dashboard_segue", sender: self)
    }
    
}


