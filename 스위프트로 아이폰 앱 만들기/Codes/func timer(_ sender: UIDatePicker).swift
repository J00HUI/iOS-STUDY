import UIKit

class ViewController: UIViewController {
    
    //MARK:- Variable
    let timeSelector: Selector = #selector(ViewController.updateTime)   // 타이머가 구동되면 실행될 함수를 지정
    let interval = 1.0  // 타이머의 간격. 1.0은 1초를 의미
    var count = 0       // 타이머가 설정한 간격대로 실행되는지 확인 하기 위한 변수
    //Variable_End
  
    @IBOutlet var currentTimeLabel : UILabel!
    @IBOutlet var pickerTimeLabel : UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //타이머 설정
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true)
        
        //timeInterval : 타이머 간격, target: 동작될 view, selctor: 타이머가 구동될 때 실행될 함수, userInfo: 사용자 정보, repeats: 반복 여부
        
    }
    
    //Picker에서 선택한 시간 pickerTimeLabel 에 저장
    @IBAction func changeDatePicker(_ sender: UIDatePicker){
        let datePickerView = sender
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-mm-dd hh:mm EEE"
        pickerTimeLabel.text = "선택 시간: " + formatter.string(from: datePickerView.date)
    }
    
    //MARK:- Func
    @objc func updateTime() {
    //  (테스트) count 값을 문자열로 변환하여 currentTimeLabel.text에 출력
    //  currentTimeLabel.text = String(count)
    //  count = count + 1
        
        let date = NSDate()     // 현재 시간을 NSDate 함수를 사용하여 가져옵니다
        
        let formatter = DateFormatter()   // 날짜를 출력하기 위하여 DateFormatter()라는 클래스의 객체 formatter를 선언합니다
        formatter.dateFormat = "yyyy-mm-dd hh:mm:ss EEE"
      
        currentTimeLabel.text = "현재시간: " + formatter.string(from: date as Date)
        // formatter.string(date)는 현재 날짜를 formatter의 dateFormat에서 설정한 포맷대로 string 메서드를 사용하여 문자열로 변환합니다
    }
    //Func_End

}

