import UIKit

class ViewController: UIViewController {

    @IBOutlet var imgView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnDrawLine(_ sender: UIButton) {
        UIGraphicsBeginImageContext(imgView.frame.size)     // 콘텍스트를 이미지 뷰의 크기와 같게 생성
        let context = UIGraphicsGetCurrentContext()!        // (그림을 그리는 도화지) 생성한 콘텍스트 정보를 가져옴
        
        // Draw Line
        // 콘텍스트에 대한 여러 가지 설정
        context.setLineWidth(2.0)
        context.setStrokeColor(UIColor.red.cgColor)

        // 이제 그림을 그리기 위하여 시작 위치로 커서를 이동 ((0,0)은 화면의 왼쪽 윗부분 지표입니다.)
        context.move(to: CGPoint(x: 70, y: 50))
        context.addLine(to: CGPoint(x: 270, y: 250))        // 현재 위치에서 지정한 위치까지 선을 추가. 그리고 싶은 선은 계속 이어서 추가할 수 있습니다.
        
        context.strokePath()            // 추가한 선을 콘텍스트에 그림
        
        // Draw Triangle
        context.setLineWidth(4.0)
        context.setStrokeColor(UIColor.blue.cgColor)
        
        context.move(to: CGPoint(x: 170, y: 200))
        context.addLine(to: CGPoint(x: 270, y: 350))
        context.addLine(to: CGPoint(x: 70, y: 350))
        context.addLine(to: CGPoint(x: 170, y: 200))
        context.strokePath()
        
        imgView.image = UIGraphicsGetImageFromCurrentImageContext()     // 현재 콘텍스트에 그려진 이미지를 가지고 와서 이미지 뷰에 힐딩
        UIGraphicsEndImageContext()            // 그림 그리기를 끝냄
        
        
    }
    @IBAction func btnDrawRectangle(_ sender: UIButton) {
        
        UIGraphicsBeginImageContext(imgView.frame.size)
        let context = UIGraphicsGetCurrentContext()!
        
        // Draw Rectangle
        context.setLineWidth(2.0)
        context.setStrokeColor(UIColor.red.cgColor)
        
        context.addRect(CGRect(x: 70, y: 100, width: 200, height: 200))
        context.strokePath()
        
        imgView.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
    }
    @IBAction func btnDrawCircle(_ sender: UIButton) {
        
        UIGraphicsBeginImageContext(imgView.frame.size)
        let context = UIGraphicsGetCurrentContext()!
        
        // Draw Ellipse
        context.setLineWidth(2.0)
        context.setStrokeColor(UIColor.red.cgColor)
        context.addEllipse(in: CGRect(x: 70, y: 50, width: 200, height: 100))   //XY 좌표 (70, 50)에서 시작하고 폭이 200픽셀, 높이가 100픽셀인 사각형 안에 내접하는 타원을 그립니다.
        context.strokePath()
        
        // Draw Circle
        context.setLineWidth(5.0)
        context.setStrokeColor(UIColor.green.cgColor)
        
        context.addEllipse(in: CGRect(x: 70, y: 200, width: 200, height: 200))  // 폭과 넓이를 같에 설정하면 원을 그릴 수 있습니다.
        context.strokePath()
        
        imgView.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
    }
    
    @IBAction func btnDrawArc(_ sender: UIButton){
        
        UIGraphicsBeginImageContext(imgView.frame.size)
        let context = UIGraphicsGetCurrentContext()!
        
        // Draw Arc
        context.setLineWidth(5.0)
        context.setStrokeColor(UIColor.red.cgColor)
        
        context.move(to: CGPoint(x: 100, y: 50))
        context.addArc(tangent1End: CGPoint(x: 250, y: 50), tangent2End: CGPoint(x: 250, y: 200), radius: CGFloat(50))  // 현재 위치에서 두 개의 접점 사이에 내접한 반지름이 50인 호를 그리겠다는 뜻
        context.addLine(to: CGPoint(x: 250, y: 200))
        
        context.move(to: CGPoint(x: 100, y: 250))
        context.addArc(tangent1End: CGPoint(x: 270, y: 250), tangent2End: CGPoint(x: 100, y: 400), radius: CGFloat(20))
        context.addLine(to: CGPoint(x: 100, y: 400))
        
        context.strokePath()
        
        imgView.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
    }
    @IBAction func btnDrawFill(_ sender: UIButton) {
        
        UIGraphicsBeginImageContext(imgView.frame.size)
        let context = UIGraphicsGetCurrentContext()!
        
        // Draw Rectangle
        context.setLineWidth(1.0)
        context.setStrokeColor(UIColor.red.cgColor)
        context.setFillColor(UIColor.red.cgColor)   // 채우기 색상 설정
        
        let rectangle = CGRect(x: 70, y: 50, width: 200, height: 100)
        context.addRect(rectangle)
        context.fill(rectangle)         // 사각형 채우기
        context.strokePath()
        
        // Draw Circle
        context.setLineWidth(1.0)
        context.setStrokeColor(UIColor.blue.cgColor)
        context.setFillColor(UIColor.blue.cgColor)
        
        let circle = CGRect(x: 70, y: 200, width: 200, height: 100)
        context.addEllipse(in: circle)
        context.fillEllipse(in: circle)
        context.strokePath()
        
        // Draw Triangle
        context.setLineWidth(1.0)
        context.setStrokeColor(UIColor.green.cgColor)
        context.setFillColor(UIColor.green.cgColor)
        
        context.move(to: CGPoint(x: 170, y: 350))
        context.addLine(to: CGPoint(x: 270, y: 450))
        context.addLine(to: CGPoint(x: 70, y: 450))
        context.addLine(to: CGPoint(x: 170, y: 350))
        context.fillPath()              // 선의 내부를 색상으로 채웁니다.
        context.strokePath()
        
        imgView.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        
    }
    
}


