import UIKit

class BadgeView: UIImageView {
    
    override func awakeFromNib() {
        
        self.layoutIfNeeded()
        layer.cornerRadius = self.frame.height / 3.0
        layer.masksToBounds = true
        
    }
}
