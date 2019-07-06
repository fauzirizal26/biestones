//
//  ViewController.swift
//  ProjectTeam1
//
//  Created by Marilyn Martha Yusnita Devi Parhusip on 23/04/19.
//  Copyright © 2019 Apple Academy. All rights reserved.
//

import UIKit


class UserProfile: UIViewController, UITextFieldDelegate {
    
    private let dataSource = ["Ayah", "Ibu", "Paman", "Bibi", "Nenek", "Kakek"]
    
    //outlets
    @IBOutlet weak var listPilihan: UIPickerView!
    @IBOutlet weak var lanjutButton: UIButton!
    @IBOutlet weak var namaTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var teleponTextField: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        namaTextField.delegate = self
        listPilihan.dataSource = self
        listPilihan.delegate = self
        emailTextField.delegate = self
        teleponTextField.delegate = self
        
        //Listen to keyboard event
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
        
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
    }
    
    //Fungsi Tekan Button
    //Actions
    @IBAction func lanjutButtonPressed(_ sender: Any) {
        
        nama = namaTextField.text!
        hideKeyboard()
    }
    
    //Methods at functions
    
    func hideKeyboard() {
        namaTextField.resignFirstResponder()
        emailTextField.resignFirstResponder()
    }
    
    
    @objc func keyboardWillChange(notification: Notification) {
        
        
    }
    //UITextFieldDelegate Methods
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        hideKeyboard()
        return true
        
    }
    
    
    
    
}

extension UserProfile: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return dataSource.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return dataSource[row]
    }
}

