//
//  membuatProfileAnak.swift
//  ProjectTeam1
//
//  Created by Marilyn Martha Yusnita Devi Parhusip on 23/04/19.
//  Copyright © 2019 Apple Academy. All rights reserved.
//

import UIKit

class membuatProfileAnak: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate {
    
    
    private let dataSourceGolDarah = ["A", "B", "O", "AB"]
    private let dataSourceJenisKelamin = ["Laki - Laki", "Perempuan"]
    private var datePicker: UIDatePicker?
    private var dataPilihanGolDarah = UIPickerView ()
    private var dataPilihanJenisKelamin = UIPickerView()
    
    
    
    @IBOutlet weak var haloOrangTuaLabel: UILabel!
    
    
    @IBOutlet weak var namaAnakTextField: UITextField!
    @IBOutlet weak var tanggalLahirTextField: UITextField!
    @IBOutlet weak var jenisKelaminTextField: UITextField!
    @IBOutlet weak var golonganDarahTextField: UITextField!
    @IBOutlet weak var imageUploaded: UIImageView!
    @IBOutlet weak var uploadFotoButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        namaAnakTextField.delegate = self
        tanggalLahirTextField.delegate = self
        jenisKelaminTextField.delegate = self
        golonganDarahTextField.delegate = self
        
        haloOrangTuaLabel.text = ("Halo \(nama),")
        
        pilihTanggal()
        dataPilihanGolDarah.delegate = self
        dataPilihanGolDarah.dataSource = self
        golonganDarahTextField.inputView = dataPilihanGolDarah
        
        dataPilihanJenisKelamin.delegate = self
        dataPilihanJenisKelamin.dataSource = self
        jenisKelaminTextField.inputView = dataPilihanJenisKelamin
        
        
        let tapGesture = UITapGestureRecognizer(target: self, action:#selector( membuatProfileAnak.viewTapped(gestureRecognizer: )))
        
        view.addGestureRecognizer(tapGesture)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
        
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
        
    }
    
    @IBAction func uploadButtonPressed(_ sender: Any) {
        
        let myPickerController = UIImagePickerController()
        myPickerController.delegate = self;
        myPickerController.sourceType = UIImagePickerController.SourceType.photoLibrary
        self.present(myPickerController, animated: true, completion: nil)
        
    }
    
    @IBAction func simpanLanjutButtonPressed(_ sender: Any) {
        
        namaAnak = namaAnakTextField.text!
        names.append(namaAnak)
        photos.append(imageAnak)
        ages.append(umurAnak)
        
        
        performSegue(withIdentifier: "segue_profile", sender: nil)
        
        
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        imageUploaded.image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        imageUploaded.backgroundColor = UIColor.clear
        
        imageAnak = imageUploaded.image
        
        self.dismiss(animated: true, completion: nil)
        
        
    }
    
    func hideKeyboard() {
        namaAnakTextField.resignFirstResponder()
        tanggalLahirTextField.resignFirstResponder()
        jenisKelaminTextField.resignFirstResponder()
        golonganDarahTextField.resignFirstResponder()
    }
    
    @objc func keyboardWillChange(notification: Notification) {
        
        let userInfo = notification.userInfo!
        let keyboardScreenEndFrame = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        let keyboardViewEndFrame = view.convert(keyboardScreenEndFrame, from: view.window)
        
        
    }
    
    @objc func dateChanged(datePicker: UIDatePicker){
        
        let dateFormater = DateFormatter()
        let birthDate = datePicker.date
        let today = Date()
        let calendar = Calendar.current
        
        dateFormater.dateFormat = "yyyy-MM-dd"
        
        let currDateString = dateFormater.string(from: today)
        let currDate = dateFormater.date(from: currDateString)!
        
        let birthDateString = dateFormater.string(from: birthDate)
        let birthDateHasil = dateFormater.date(from: birthDateString)!
        
        let selisih = calendar.dateComponents([.month], from: birthDateHasil, to: currDate)
        
        tanggalLahirTextField.text = dateFormater.string(from: datePicker.date)
        view.endEditing(true)
        
        print(selisih.month)
        print(selisih.isLeapMonth)
        
        umurAnak = selisih.month!
        
    }
    
    @objc func viewTapped(gestureRecognizer: UITapGestureRecognizer){
        view.endEditing(true)
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        hideKeyboard()
        return true
        
    }
    
    func pilihTanggal() {
        
        datePicker = UIDatePicker()
        datePicker?.datePickerMode = .date
        tanggalLahirTextField.inputView = datePicker
        datePicker?.addTarget(self, action:#selector( membuatProfileAnak.dateChanged(datePicker:)), for: .valueChanged)
        
        
    }
    
    
    
}


extension membuatProfileAnak: UIPickerViewDataSource, UIPickerViewDelegate {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == dataPilihanGolDarah{
            return dataSourceGolDarah.count
        }
        else{
            return dataSourceJenisKelamin.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == dataPilihanGolDarah{
            golonganDarahTextField.text = dataSourceGolDarah[row]
        }
        else{
            jenisKelaminTextField.text = dataSourceJenisKelamin[row]
        }
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == dataPilihanGolDarah{
            return dataSourceGolDarah[row]
        }
        else{
            return dataSourceJenisKelamin[row]
        }
    }
    
    
}
