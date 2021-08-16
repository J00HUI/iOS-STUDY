import UIKit

class ViewController: UIViewController {
    
    //아래의 세 변수는 앱이 종료될 때까지 변하지 않기 때문에 상수로 처리
    let imgOn = UIImage(named: "lamp-on.png")
    let imgOff = UIImage(named: "lamp-off.png")
    let imgRemove = UIImage(named: "lamp-remove.png")
    
    var isLampon = true // 전구가 켜졌는지의 여부를 나타내는 변수. 켜진 상태는 true, 꺼진 상태는 false
    
    @IBOutlet var lampImageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        lampImageView.image = imgOn
     
    }
    
    @IBAction func lampOn(_ sender: UIButton){
        
        if(isLampon==true){ // 전구가 켜져 있다고 alert를 실행
            
            // UIAlertController를 생성합니다.
            let lampOnAlert = UIAlertController(title: "경고", message: "현재 on 상태입니다", preferredStyle: UIAlertController.Style.alert)
            
            // UIAlertAction을 생성합니다. (특별한 동작을 하지 않을 경우에는 handler를 nil로 합니다.)
            let onAction = UIAlertAction(title: "네, 알겠습니다.", style: UIAlertAction.Style.default, handler: nil)
            
            lampOnAlert.addAction(onAction) // 생성된 onAction을 얼럿에 추가합니다.
            present(lampOnAlert, animated: true, completion: nil)   // present 메서드를 실행합니다.
        }
        else {  // 전구를 켬
            lampImageView.image = imgOn
            isLampon = true
        }
    }
    @IBAction func lampOff(_ sender: UIButton){
        if isLampon{    // 전구가 켜져 있을 경우, 전구를 끌 것인지를 묻는 Alert를 실행
            let lampOffAlert = UIAlertController(title: "램프 끄기", message: "램프를 끄시겠습니까?", preferredStyle: UIAlertController.Style.alert)
            
            // 전구를 꺼야 하므로, 핸들러 중간에 중괄호 {} 를 넣어 추가적으로 작업합니다. 반드시 self를 붙여야 에러가 발생하지 않습니다.
            let offAction = UIAlertAction(title: "네", style: UIAlertAction.Style.default, handler :{
                ACTION in self.lampImageView.image = self.imgOff
                self.isLampon = false
            })
            
            // UIAlertAction을 추가로 생성합니다. 특별한 동작을 하지 않을 경우에는 핸들러를 nil로 합니다.
            let cancelAction = UIAlertAction(title: "아니오", style: UIAlertAction.Style.default, handler: nil)
            
            lampOffAlert.addAction(offAction)
            lampOffAlert.addAction(cancelAction)
            
            present(lampOffAlert, animated: true, completion: nil)
        }
        
    }
    @IBAction func removeLamp(_ sender: UIButton){
        let removeAlert = UIAlertController(title: "램프 제거", message: "램프를 제거하시겠습니까?", preferredStyle: UIAlertController.Style.alert)
        
        let offAction = UIAlertAction(title: "아니오, 끕니다(off)", style: UIAlertAction.Style.default, handler: {
            ACTION in self.lampImageView.image = self.imgOff
            self.isLampon = false
        })
        
        // 전구를 켜는 동작을 추가합니다.
        // 핸들러에 {}를 넣어 추가 작업을 할 수 있는데, 이번에는 핸들러 매개변수를 삭제하고 뒤쪽에 {}를 넣는 방법을 이용합니다.
        // 두 가지 방법 모두 에러 없이 동작을 구현합니다.
        let onAction = UIAlertAction(title: "아니오, 켭니다(on)", style: UIAlertAction.Style.default) {
            ACTION in
            self.lampImageView.image = self.imgOn
            self.isLampon = true
        }
        
        let removeAction = UIAlertAction(title: "네, 제거합니다.", style: UIAlertAction.Style.default, handler: {
            ACTION in
            self.lampImageView.image = self.imgRemove
            self.isLampon = false
        })
        
        removeAlert.addAction(offAction)
        removeAlert.addAction(onAction)
        removeAlert.addAction(removeAction)
        
        present(removeAlert, animated: true, completion: nil)
    }
}

