import UIKit

class ViewController: UIViewController {

    @IBOutlet var imgView: UIImageView!
    @IBOutlet var txtLineSize: UITextField!
    
    var lastPoint: CGPoint!     // 바로 전에 터치하거나 이동한 위치
    var lineSize: CGFloat = 2.0
    var lineColor = UIColor.red.cgColor
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        txtLineSize.text = String(Int(lineSize))
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first! as UITouch       // 현재 발생한 터치 이벤트를 가지고 옴
        
        lastPoint = touch.location(in: imgView)     // 터치된 위치를 lastPoint 변수에 저장
        
    }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        UIGraphicsBeginImageContext(imgView.frame.size)                // 그림 그리기 위한 콘텍스트 생성
        UIGraphicsGetCurrentContext()?.setStrokeColor(lineColor)       // 선 색상을 설정
        UIGraphicsGetCurrentContext()?.setLineCap(CGLineCap.round)      // 라인의 끝 모양을 라운드로 설정
        UIGraphicsGetCurrentContext()?.setLineWidth(lineSize)           // 선 두께를 설정
        
        let touch = touches.first! as UITouch           // 현재 발생한 터치 이벤트를 가지고 옴
        let currPoint = touch.location(in: imgView)     // 터치된 위치를 currPoint로 가지고 옴
        
        imgView.image?.draw(in: CGRect(x: 0, y: 0, width: imgView.frame.size.width, height: imgView.frame.size.height))     // 현재 이미지 뷰에 있는 전체 이미지를 이미지 뷰 크기로 그림
        
        UIGraphicsGetCurrentContext()?.move(to: CGPoint(x: lastPoint.x, y: lastPoint.y))        // lastPoint 위치로 시작 위치를 이동
        UIGraphicsGetCurrentContext()?.addLine(to: CGPoint(x: currPoint.x, y: currPoint.y))     // lastPoint에서 현재 위치인 currPoint까지 선을 추가
        UIGraphicsGetCurrentContext()?.strokePath()     // 추가한 선을 콘텍스트에 그림
        
        imgView.image = UIGraphicsGetImageFromCurrentImageContext()     // 현재 콘텍스트에 그려진 이미지를 가지고 와서 이미지 뷰에 할당
        UIGraphicsEndImageContext()
        
        lastPoint = currPoint
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        //imgView.image = nil
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        // 사용자가 iOS 기기를 흔들었을 때 이미지 뷰 위에 그렸던 스케치가 지워지도록 (시뮬레이터) control + command + z / Device -> Shake)
        if motion == .motionShake {
            imgView.image = nil
        }
    }
    @IBAction func clearImageView(_ sender: UIButton) {
        imgView.image = nil     // 이미지 뷰의 이미지를 없애는 것
    }
    
    @IBAction func btnColorBlack(_ sender: UIButton) {
        lineColor = UIColor.black.cgColor
    }
    
    @IBAction func btnColorRed(_ sender: UIButton) {
        lineColor = UIColor.red.cgColor
    }
    
    @IBAction func btnColorGreen(_ sender: UIButton) {
        lineColor = UIColor.green.cgColor
    }
    
    @IBAction func btnColorBlue(_ sender: UIButton) {
        lineColor = UIColor.blue.cgColor
    
    }
    
    @IBAction func txtEditChanged(_ sender: UITextField) {
        if txtLineSize.text != "" {
            lineSize = CGFloat(Int(txtLineSize.text!)!)
        }
    }
    
    @IBAction func txtDidEndOnExit(_ sender: UITextField) {
        if txtLineSize.text != "" {
            lineSize = CGFloat(Int(txtLineSize.text!)!)
        }
    }
}

