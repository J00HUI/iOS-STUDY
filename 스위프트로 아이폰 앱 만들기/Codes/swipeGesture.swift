import UIKit

class ViewController: UIViewController {
    
    let numOfTouchs = 2     // 두 손가락을 이용한 스외이프 제스처 인식, 두 손가락을 사용하려면 option을 눌러야 하나 스와이프를 하면 두 개의 동그라미가 서로 반대 방향으로 움직이므로, 손가락을 같은 방향으로 스와이프하려면 option + shift 를 함께 누르고 움직이기.
    
    // 이미지를 보관할 배열 선언
    var imgLeft = [UIImage]()
    var imgRight = [UIImage]()
    var imgUp = [UIImage]()
    var imgDown = [UIImage]()
    
    @IBOutlet var imgViewUp: UIImageView!
    @IBOutlet var imgViewLeft: UIImageView!
    @IBOutlet var imgViewDown: UIImageView!
    @IBOutlet var imgViewRight: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 각 배열에 이미지 추가
        imgUp.append(UIImage(named: "arrow-up-black.png")!)
        imgUp.append(UIImage(named: "arrow-up-red.png")!)
        imgUp.append(UIImage(named: "arrow-up-green.png")!)
        imgDown.append(UIImage(named: "arrow-down-black.png")!)
        imgDown.append(UIImage(named: "arrow-down-red.png")!)
        imgDown.append(UIImage(named: "arrow-down-green.png")!)
        imgLeft.append(UIImage(named: "arrow-left-black.png")!)
        imgLeft.append(UIImage(named: "arrow-left-red.png")!)
        imgLeft.append(UIImage(named: "arrow-left-green.png")!)
        imgRight.append(UIImage(named: "arrow-right-black.png")!)
        imgRight.append(UIImage(named: "arrow-right-red.png")!)
        imgRight.append(UIImage(named: "arrow-right-green.png")!)
        
        // 네 개의 이미지 뷰에 초기 이미지(검은색) 저장
        imgViewUp.image = imgUp[0]
        imgViewDown.image = imgDown[0]
        imgViewLeft.image = imgLeft[0]
        imgViewRight.image = imgRight[0]
        
        
        // 한 손가락 스와이프 제스처 등록(위, 아래, 왼쪽, 오른쪽)
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGesture(_:)))
        swipeUp.direction = UISwipeGestureRecognizer.Direction.up
        self.view.addGestureRecognizer(swipeUp)     // 뷰 객체의 addGestureRecognizer 메서드를 사용하여 위쪽 방향의 스와이프 제스처를 등록
        
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGesture(_:)))
        swipeDown.direction = UISwipeGestureRecognizer.Direction.down
        self.view.addGestureRecognizer(swipeDown)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGesture(_:)))
        swipeLeft.direction = UISwipeGestureRecognizer.Direction.left
        self.view.addGestureRecognizer(swipeLeft)
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGesture(_:)))
        swipeRight.direction = UISwipeGestureRecognizer.Direction.right
        self.view.addGestureRecognizer(swipeRight)
        
        
        // 두 손가락 스와이프 제스처 등록(위, 아래, 왼쪽, 오른쪽)
        let swipeUpMulti = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGestureMulti(_:)))
        swipeUpMulti.direction = UISwipeGestureRecognizer.Direction.up
        swipeUpMulti.numberOfTouchesRequired = numOfTouchs
        self.view.addGestureRecognizer(swipeUpMulti)
        
        let swipeUpDownMulti = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGestureMulti(_:)))
        swipeUpDownMulti.direction = UISwipeGestureRecognizer.Direction.down
        swipeUpDownMulti.numberOfTouchesRequired = numOfTouchs
        self.view.addGestureRecognizer(swipeUpDownMulti)
        
        let swipeUpLeftMulti = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGestureMulti(_:)))
        swipeUpLeftMulti.direction = UISwipeGestureRecognizer.Direction.left
        swipeUpLeftMulti.numberOfTouchesRequired = numOfTouchs
        self.view.addGestureRecognizer(swipeUpLeftMulti)
        
        let swipeUpRightMulti = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGestureMulti(_:)))
        swipeUpRightMulti.direction = UISwipeGestureRecognizer.Direction.right
        swipeUpRightMulti.numberOfTouchesRequired = numOfTouchs
        self.view.addGestureRecognizer(swipeUpRightMulti)
        
    }
    
    // 한 손가락 스와이프 제스처를 행했을 때 실행할 메소드
    @objc func respondToSwipeGesture(_ gesture: UIGestureRecognizer){
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {        // 만일 제스처가 있다면
            
            // 우선 전체 이미지 뷰를 검은색 화살표로 초기화
            imgViewUp.image = imgUp[0]
            imgViewDown.image = imgDown[0]
            imgViewLeft.image = imgLeft[0]
            imgViewRight.image = imgRight[0]
            
            
            // 제스처의 방향의 따라 해당 방향의 이미지를 빨간색 이미지로 변경
            switch swipeGesture.direction{
            
            case UISwipeGestureRecognizer.Direction.up:
                imgViewUp.image = imgUp[1]
            case UISwipeGestureRecognizer.Direction.down:
                imgViewDown.image = imgDown[1]
            case UISwipeGestureRecognizer.Direction.left:
                imgViewLeft.image = imgLeft[1]
            case UISwipeGestureRecognizer.Direction.right:
                imgViewRight.image = imgRight[1]
            default:
                break
                
            }
           
        }
    }
    
    // 두 손가락 스와이프 제스처를 행했을 때 실행할 액션 메서드
    @objc func respondToSwipeGestureMulti(_ gesture: UIGestureRecognizer){
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            imgViewUp.image = imgUp[0]
            imgViewDown.image = imgDown[0]
            imgViewLeft.image = imgLeft[0]
            imgViewRight.image = imgRight[0]
            
            // 발생한 이벤트가 각 방향의 스와이프 이벤트라면 해당 이미지 뷰를 초록색 이미지로 변경
            switch swipeGesture.direction {
            case UISwipeGestureRecognizer.Direction.up:
                imgViewUp.image = imgUp[2]
            case UISwipeGestureRecognizer.Direction.down:
                imgViewDown.image = imgDown[2]
            case UISwipeGestureRecognizer.Direction.left:
                imgViewLeft.image = imgLeft[2]
            case UISwipeGestureRecognizer.Direction.right:
                imgViewRight.image = imgRight[2]
            default:
                break
            }
        }
        
    }


}

