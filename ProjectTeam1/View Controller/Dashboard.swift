import UIKit

class Dashboard: UIViewController {
    
    @IBOutlet weak var fotoAnak: UIImageView!
    @IBOutlet weak var namaAnakKu: UILabel!
    @IBOutlet weak var umurAnakKu: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Success ACtion")
        namaAnakKu.text = namaAnak
        umurAnakKu.text = "\(umurAnak!) bulan"
        fotoAnak.image = imageAnak
    }
}
