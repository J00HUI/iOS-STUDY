import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var txtPinch: UILabel!
    @IBOutlet var imgPinch: UIImageView!
    
 
    var initialFontSize: CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        let pinch = UIPinchGestureRecognizer(target: self, action: #selector(ViewController.doPinch(_:)))
        self.view.addGestureRecognizer(pinch)
    }
    
    @objc func doPinch(_ pinch: UIPinchGestureRecognizer){
        
        // Text
//        if(pinch.state == UIGestureRecognizer.State.began){
//            initialFontSize = txtPinch.font.pointSize
//        } else {
//            txtPinch.font = txtPinch.font.withSize(initialFontSize * pinch.scale)
//        }
        
        
        // Image
        imgPinch.transform = imgPinch.transform.scaledBy(x: pinch.scale, y: pinch.scale)
        // 이미지 imgPinch 를 scale 에 맞게 변환합니다.
        
        pinch.scale = 1     // 다음 변환을 위하여 핀치 스케일 속성을 1로 변환합니다.
        
    }


}

