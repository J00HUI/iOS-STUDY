//ViewContoller

import UIKit

class ViewController: UIViewController, EditDelegate {
 
    let imgOn = UIImage(named: "lamp-on.png")
    let imgOff = UIImage(named: "lamp-off.png")
    
    var isOn = true
    
    @IBOutlet var textMessage: UITextField!
    @IBOutlet var imgView: UIImageView!
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imgView.image = imgOn
    }
    
    // 세그웨이 이용해 화면 전환
    // prepare 함수는 해당 세그웨이가 해당 뷰 컨트롤러로 전환되기 직전에 호출되는 함수이며, 데이터 전달을 위해 사용됩니다.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let editViewController = segue.destination as! EditViewController
        
        if segue.identifier == "editButton" {   // 버튼으로 클릭한 경우
            editViewController.textWayValue = "segue: use button"
        }
        else if segue.identifier == "editBarButton"{    // 바 버튼을 클릭한 경우
            editViewController.textWayValue = "segue: use Bar button"
        }
        
        // 수정화면으로 텍스트 메시지와 전구 상태 전달
        editViewController.txtMessage = textMessage.text!
        editViewController.isOn = isOn
        editViewController.delegate = self
     }
    
    
    // '수정화면'의 데이터를 '메인화면'에 전달
    func didMessageEditDone(_ controller: EditViewController, message: String) {
        textMessage.text = message
    }
    
    func didImageOnOffDone(_ controller: EditViewController, isOn: Bool) {
        if isOn {
            imgView.image = imgOn
            self.isOn = true
        } else {
            imgView.image = imgOff
            self.isOn = false
        }
    }
}


============================================================================================================================================
//EditViewContoller


import UIKit

protocol EditDelegate {
    func didMessageEditDone(_ controller: EditViewController, message: String)
    func didImageOnOffDone(_ controller: EditViewController, isOn: Bool)
}

class EditViewController: UIViewController {
    
    var textWayValue: String = ""
    var txtMessage: String = ""
    var delegate: EditDelegate?
    var isOn = false
    
    @IBOutlet var labelWay: UILabel!
    @IBOutlet var textMessage: UITextField!
    @IBOutlet var swIsOn: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        labelWay.text = textWayValue
        textMessage.text = txtMessage
        swIsOn.isOn = isOn
    }
    
    @IBAction func swImageOnOff(_ sender: UISwitch) {
        if sender.isOn {
            isOn = true
        } else {
            isOn = false
        }
    }
    
    @IBAction func buttonDone(_ sender: UIButton) {
        
        if delegate != nil {
            delegate?.didMessageEditDone(self, message: textMessage.text!)
            delegate?.didImageOnOffDone(self, isOn: isOn)
        }
        
        // 세그웨이를 추가할 때 [Action Segue] 를 'Show' 형태로 했기 때문에 되돌아갈 때는 'pop' 형태로 해야 합니다.
        _ = navigationController?.popViewController(animated: true)
        
    }
    
}


