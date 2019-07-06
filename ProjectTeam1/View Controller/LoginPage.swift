import UIKit

class LoginPage: UIViewController, UITextFieldDelegate {
    
    // Outlet
    @IBOutlet weak var txtUsername: TextView!
    @IBOutlet weak var txtPassword: TextView!
    
    
    // didLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        txtUsername.setUpField(placeholder: "username")
        txtPassword.setUpField(placeholder: "password")
        
        txtPassword?.delegate = self
        txtUsername?.delegate = self
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)

    }

    deinit {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillChangeFrameNotification, object: nil)

}
    
    @IBAction func signInButton(_ sender: Any) {
        performSegue(withIdentifier: "registerSegue", sender: self)
    }
    
    
    func hideKeyboard() {
        txtUsername?.resignFirstResponder()
        txtPassword?.resignFirstResponder()

    }

@objc func keyboardWillChange(notification: Notification) {

    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {

        hideKeyboard()
        return true

    }


    }


