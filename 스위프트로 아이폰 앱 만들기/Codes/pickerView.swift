// pickerview delegate 연결 해야 함.

import UIKit

class ViewController: UIViewController , UIPickerViewDelegate, UIPickerViewDataSource{//: 클래스명 -> 클래스 상속
    
    let MAX_ARRAY_NUM = 4           // 이미지 파일명을 저장할 배열의 최대 크기를 지정합니다.
    let PICKER_VIEW_COLUMN = 1      // 피커 뷰의 열의 개수를 지정합니다.
    var imageFileName = ["1.jpeg", "2.jpeg", "3.jpeg", "4.jpeg"]    // 이미지의 파일명을 지정할 배열입니다.
    var imageArray = [UIImage?]()
    let PICKER_VIEW_HEIGHT:CGFloat = 80 // 피커 뷰의 높이 변경
    
    
    @IBOutlet var imagePicker : UIPickerView!
    @IBOutlet var imageFileNameLabel : UILabel!
    @IBOutlet var imageView : UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for i in 0 ..< MAX_ARRAY_NUM {  // i 라는 변수를 0부터 MAX_ARRAY_NUM 보다 작을 때 까지 루프를 실행
            let image = UIImage(named: imageFileName[i])
            imageArray.append(image)
        }
        
        imageFileNameLabel.text = imageFileName[0]
        imageView.image = imageArray[0]
    }
    
    // 1.피커 뷰의 컴포넌트 수 설정
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return PICKER_VIEW_COLUMN
    }
    // 피커뷰의 높이 변경
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return PICKER_VIEW_HEIGHT
    }
    // 2.피커 뷰의 개수 설정
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return imageFileName.count
    }
    
    //3. 피커 뷰의 각 row 타이틀 설정
//    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//        return imageFileName[row]
//    }
    
    /*
     1. 피커 뷰에게 컴포넌트의 수를 정수 값으로 넘겨주는 델리게이트 메서드입니다.
     피커뷰의 컴포넌트는 피커 뷰에 표시되는 열의 개수를 의미합니다.
     
     2. numberofRowsInComponent 인수를 가지는 델리케이트 메서드입니다.
     피커 뷰에게 컴포넌트의 열의 개수를 정수 값으로 넘겨줍니다.
     이 값은 피커 뷰의 해당 열에서 선택할 수 있는 행의 개수를 의미합니다.
     
     3. titleForRow 인수를 가지는 델리게이트 메서드입니다.
     피커 뷰에게 컴포넌트의 각 열의 타이틀을 문자열(String) 값으로 넘겨줍니다.
     여기서는 imageFileName에 저장되어 있는 파일명을 넘겨줍니다.
    */
    
    // 사용자가 피커 뷰의 룰렛을 선택했을 때 호출
    // 사용자가 선택한 피커 뷰의 row를 사용하여 원하는 일을 코딩할 수 있습니다.
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        imageFileNameLabel.text = imageFileName[row]
        imageView.image = imageArray[row]
    }
    
    // 3. 주석 처리하고 추가
    // 각 row 의 view를 설정하고 UIView 타입을 리턴 (여기서는 imageView에 저장되어 있는 이미지 를 리턴)
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let imageView = UIImageView(image: imageArray[row])     // 선택된 row에 해당하는 이미지를 imageArray에서 가져옵니다.
        imageView.frame = CGRect(x: 0, y: 0, width: 100, height: 150)   // 이미지 뷰의 프레임의 크기를 설정합니다.
        
        return imageView
    }

}

