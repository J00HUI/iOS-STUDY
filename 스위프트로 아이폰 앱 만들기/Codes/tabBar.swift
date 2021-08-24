import UIKit

class ViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func btmMoveImageView(_ sender: UIButton) {
        
        tabBarController?.selectedIndex = 1     // 이미지 탭 뷰로 이동
    }
    
    
    @IBAction func btnMoveDatePickerView(_ sender: UIButton) {
        
        tabBarController?.selectedIndex = 2     // 데이트 피커 뷰 탭으로 이동
    }
}

